//
//  WeatherForecastRequestEntity.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import ObjectMapper

class WeatherForecastRequestEntity: BaseResponseEntity {
    var city = ""
    var cnt: Int = 7
    var appId = Constants.AppID
    var unit = "metric"

    required convenience init?(map: Map) {
        self.init()
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
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
