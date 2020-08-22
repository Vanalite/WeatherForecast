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


class WeatherEntity: BaseResponseEntity {
    @objc dynamic var pressure = 0
    @objc dynamic var humidity = 0
    @objc dynamic var descriptionText: String = ""
    @objc dynamic var temperature: Float = 0
    @objc dynamic var timestamp = 0

    let cities = LinkingObjects(fromType: CityWeatherEntity.self, property: CityWeatherEntity.CodingKeys.weatherList.rawValue)
    var city: CityWeatherEntity? {
        return self.cities.first
    }

    required convenience init?(map: Map) {
        self.init()
    }

    override func mapping(map: Map) {
        super.mapping(map: map)
        timestamp <- map[CodingKeys.dt.rawValue]
        pressure <- map[CodingKeys.pressure.rawValue]
        humidity <- map[CodingKeys.humidity.rawValue]
        descriptionText <- map[CodingKeys.weather.rawValue + "." + "0" + "." + CodingKeys.description.rawValue]

        var minTemp: Float = 0, maxTemp: Float = 0
        minTemp <- map[CodingKeys.temp.rawValue + "." + CodingKeys.min.rawValue]
        maxTemp <- map[CodingKeys.temp.rawValue + "." + CodingKeys.max.rawValue]
        temperature = (minTemp + maxTemp) / 2
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
