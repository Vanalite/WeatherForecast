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

//    func mapApiError<T: BaseMappable>(_ type: T.Type) -> Single<ElementType> {
//
//        return flatMap { response -> Single<ElementType> in
//            do {
//                let responseObject = try response.mapObject(type)
//            } catch {
//                return Single.error(MoyaError.jsonMapping(response))
//            }
//            return Single.just(responseObject)
//        } // Handle catching error here
//        .catchError { error in
//        }
//    }
}
