//
//  CityWeather.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/19/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import RealmSwift
import ObjectMapper_Realm
import ObjectMapper


class CityWeatherEntity: Object, Mappable {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var country = ""
    @objc dynamic var population = 0
    @objc dynamic var timezone = 0
    @objc dynamic var lon: Float = 0
    @objc dynamic var lat: Float = 0


    required convenience init?(map: Map) {
        self.init()
    }

    func mapping(map: Map) {
        id <- map[CodingKeys.id.rawValue]
        name <- map[CodingKeys.name.rawValue]
        country <- map[CodingKeys.country.rawValue]
        population <- map[CodingKeys.population.rawValue]
        timezone <- map[CodingKeys.timezone.rawValue]
        lon <- map[CodingKeys.coord.rawValue + "." + CodingKeys.lon.rawValue]
        lat <- map[CodingKeys.coord.rawValue + "." + CodingKeys.lat.rawValue]
    }

    enum CodingKeys: String {
        case id
        case name
        case country
        case population
        case timezone
        case coord
        case lon
        case lat

    }

}
