//
//  RequestPlugin.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation
import Moya
import RealmSwift

class RequestPlugin: PluginType {
    public func prepare(_ request: URLRequest, target: TargetType) -> URLRequest {
        return prepareHTTPHeaders(of: request, target: target)
    }

    func prepareHTTPHeaders(of request: URLRequest, target: TargetType) -> URLRequest {
        var request = request

        if let api = target as? NetworkRouter {

        // Set header here
//                request.setValue(sessionToken, forHTTPHeaderField: Constants.HTTPHeaders.Authorization)
        }

        return request
    }
}
