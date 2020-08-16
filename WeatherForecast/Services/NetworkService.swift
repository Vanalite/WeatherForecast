//
//  NetworkService.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Moya
import RxSwift
import ObjectMapper

enum NetworkRouter: TargetType {

    case content(request: WeatherForecastRequestEntity)

    var sampleData: Data {
        return Data()
    }


    var headers: [String : String]? {
        return nil
    }

    var baseURL: URL {
        return URL(string: Constants.baseURLPath)!
    }

    var method: Moya.Method {
        switch self {
        case .content:
            return .get
        }
    }

    var path: String {
        switch self {
        case .content:
            return "/daily"
        }
    }

    var task: Task {
        switch self {
            case .content(let request):
                return .requestParameters(parameters: request.toJSON(), encoding: URLEncoding.queryString)
        }
    }
}


class NetworkService: NSObject {
    var apiProvider: APIProvider

    init(apiProvider: APIProvider = APIProvider.shared) {
        self.apiProvider = apiProvider
    }

    func getWeatherForecast(_ city: String, cnt: Int?, unit: String)-> Single<WeatherForecastResponseEntity> {
        let request = WeatherForecastRequestEntity()
        request.city = city
        if let cnt = cnt {
            request.cnt = cnt
        }
        request.unit = unit

        return downloadEntity(endpoint: .content(request: request))
    }

    private func downloadEntity<T: Mappable>(endpoint: NetworkRouter, context: MapContext? = nil) -> Single<T> {
        return download(endpoint: endpoint, context: context)
            .observeOn(MainScheduler.instance)
    }

    func download<T: Mappable>(endpoint: NetworkRouter, context: MapContext? = nil) -> Single<T> {
        if Thread.isMainThread {
//            if AppDelegate.shared().reachability.connection == .none {
//                let error = InspectorioError(message: Strings.NO_NETWORK_MESSAGE)
//                AppDelegate.topViewController()?.presentNetworkAlert()
//                return Single.error(error)
//            }
        }

        return apiProvider
            .provider
            .rx
            .request(endpoint, callbackQueue: DispatchQueue.global(qos: .utility))
            .filterSuccessfulStatusCodes()
//            .mapApiError(T.self)
            .mapObject(T.self, context: context)
    }

}

