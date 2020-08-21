//
//  WeatherDataSource.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/22/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation

struct WeatherDataSource {
    var date: String
    var descriptionText: String
    var temperature: Float
    var pressure: Int
    var humidity: Int

    var temperatureText: String {
        return "\(String(format: "%.1f", temperature))°C"
    }

    var pressureText: String {
        return "\(pressure)"
    }

    var humidityText: String {
        return "\(humidity)%"
    }
}
