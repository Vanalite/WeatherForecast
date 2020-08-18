//
//  WeatherEntity.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/19/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import RealmSwift
import ObjectMapper_Realm
import ObjectMapper


class WeatherEntity: Object, Mappable {
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var temperature = 0
    @objc dynamic var timestamp = 0

    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        timestamp <- map[CodingKeys.dt.rawValue]
        pressure <- map[CodingKeys.pressure.rawValue]
        humidity <- map[CodingKeys.humidity.rawValue]
        descriptionText <- map[CodingKeys.weather.rawValue + "." + CodingKeys.description.rawValue]

        var minTemp: Float = 0, maxTemp: Float = 0
        minTemp <- map[CodingKeys.temp.rawValue + "." + CodingKeys.min.rawValue]
        maxTemp <- map[CodingKeys.temp.rawValue + "." + CodingKeys.max.rawValue]
        temperature = Int((minTemp + maxTemp) / 2)
    }

    enum CodingKeys: String {
        case dt
        case pressure
        case humidity
        case weather
        case description
        case temp
        case min
        case max
    }

}
