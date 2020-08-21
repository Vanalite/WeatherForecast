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


class WeatherForecastResponseEntity: BaseResponseEntity {

    @objc dynamic var cnt = 7
    @objc dynamic var city: CityWeatherEntity?

    required convenience init?(map: Map) {
        self.init()
    }
    
    override func mapping(map: Map) {
        super.mapping(map: map)
        cnt <- map[CodingKeys.cnt.rawValue]
        city <- map[CodingKeys.city.rawValue]
        if let array = Mapper<WeatherEntity>().mapArray(JSONObject: map[CodingKeys.list.rawValue].currentValue) {
            self.city?.weatherList.removeAll()
            self.city?.weatherList.append(objectsIn: array)
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
