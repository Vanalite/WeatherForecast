//
//  APIProvider.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Moya
import RealmSwift
import RxSwift
import RxOptional

private func JSONResponseDataFormatter(_ data: Data) -> Data {
    do {
        let dataAsJSON = try JSONSerialization.jsonObject(with: data)
        let prettyData =  try JSONSerialization.data(withJSONObject: dataAsJSON, options: .prettyPrinted)
        return prettyData
    } catch {
        return data // fallback to original data if it can't be serialized.
    }
}

class APIProvider {

    static let shared = APIProvider()
    let provider: MoyaProvider<NetworkRouter>

    init(endpointClosure: @escaping MoyaProvider<NetworkRouter>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
         stubClosure: MoyaProvider<NetworkRouter>.StubClosure? = nil) {
        var plugins: [Moya.PluginType] = []
        let requestPlugin = RequestPlugin()

        plugins.append(requestPlugin)

        let defaultStubClosure = { (target: TargetType) -> Moya.StubBehavior in
            guard let _ = target as? NetworkRouter else { return .never }
            return .immediate
        }
        let stubClosure = stubClosure ?? defaultStubClosure
        self.provider = MoyaProvider<NetworkRouter>(endpointClosure: endpointClosure,
                                                     stubClosure: stubClosure,
                                                     plugins: plugins)
    }
}
