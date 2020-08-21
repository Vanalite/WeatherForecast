//
//  SingleExtension.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation
import SwiftyJSON
import RxSwift
import Moya
import Moya_ObjectMapper
import ObjectMapper

enum NetError: Error {
    case ResponseTypeError
    case JsonError
    case ModelCovertFail
    case fail(message:String)
}

public extension Single where TraitType == SingleTrait, ElementType == Response {

    func mapObject<T: BaseMappable>(_ type: T.Type, context: MapContext? = nil) -> Single<T> {
        return flatMap { response -> Single<T> in
            return Single.just(try response.mapObject(type, context: context))
        }
    }

    func mapApiError() -> Single<ElementType> {
        let defaultErrorResponse = BaseResponseEntity()

        return flatMap { response -> Single<ElementType> in
            let statusCode: Int
            do {
                let responseObject = try response.mapObject(BaseResponseEntity.self)
                statusCode = Int(responseObject.code) ?? response.statusCode
            } catch {
                defaultErrorResponse.message = "Endpoint response data is corrupted"
                return Single.error(defaultErrorResponse)
            }
            if statusCode == 200 {
                return Single.just(response)
            } else {
                defaultErrorResponse.message = "Error request"
                return Single.error(defaultErrorResponse)
            }

        }.catchError { error in
            defaultErrorResponse.message = "Endpoint response data is corrupted"
            return Single.error(defaultErrorResponse)
        }
    }

    func json() -> Single<JSON> {
        return map { response in
            if let json = try? JSON(data: response.data) {
                if response.statusCode != 200 {
                    throw NetError.fail(message: json["msg"].stringValue)
                }
                if json["code"].intValue == 11111 {
                    return json["data"]
                }else{
                    throw NetError.fail(message: json["msg"].stringValue)
                }
            }
            throw NetError.JsonError
        }
    }
}

public extension PrimitiveSequence where Trait == SingleTrait, Element == JSON {

    func mapObject<T: BaseMappable>(type: T.Type) -> Single<T> {
        return map { json in

            guard let model = Mapper<T>().map(JSON: json.dictionaryValue) else {
                throw NetError.ModelCovertFail
            }
            return model
        }
    }

    func mapArray<T: BaseMappable>(type: T.Type) -> Single<[T]> {
        return map { json in
            guard let arrayObj = json.arrayObject else {
                throw NetError.ModelCovertFail
            }
            return Mapper<T>().mapArray(JSONObject: arrayObj)!
        }
    }
}
