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

    @objc dynamic var data = ""

    required convenience init?(map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        data <- map[CodingKeys.data.rawValue]
    }
    
    enum CodingKeys: String {
        case data
    }
}
