//
//  SingleExtension.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation

import RxSwift
import Moya
import Moya_ObjectMapper
import ObjectMapper

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
                statusCode = responseObject.status.value ?? responseObject.code.value ?? response.statusCode
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

}
