//
//  WeatherForecastResponseEntity.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/16/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import RealmSwift
import ObjectMapper_Realm
import ObjectMapper


class WeatherForecastResponseEntity: Object, Mappable {

    @objc dynamic var cod = ""
    @objc dynamic var message = 0
    @objc dynamic var cnt = 7
    @objc dynamic var city: CityWeatherEntity?
    var weatherList: List<WeatherEntity> = List<WeatherEntity>()

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        cod <- map[CodingKeys.cod.rawValue]
        message <- map[CodingKeys.message.rawValue]
        cnt <- map[CodingKeys.cnt.rawValue]
        city <- map[CodingKeys.city.rawValue]
        if let array = Mapper<WeatherEntity>().mapArray(JSONObject: map[CodingKeys.list.rawValue].currentValue) {
            self.weatherList.removeAll()
            self.weatherList.append(objectsIn: array)
        }
    }
    
    enum CodingKeys: String {
        case cod
        case message
        case cnt
        case city
        case list
    }
}
