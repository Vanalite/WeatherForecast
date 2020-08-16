//
//  WeatherForecastRequestEntity.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import ObjectMapper

class WeatherForecastRequestEntity: Mappable {
    var city = ""
    var cnt: Int = 7
    var appId = Constants.AppID
    var unit = ""

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        city <- map[CodingKeys.city.rawValue]
        cnt <- map[CodingKeys.cnt.rawValue]
        appId <- map[CodingKeys.appId.rawValue]
        unit <- map[CodingKeys.unit.rawValue]
    }

    enum CodingKeys: String {
        case city
        case cnt
        case appId
        case unit

    }
}
