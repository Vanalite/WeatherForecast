//
//  WeatherDataSource.swift
//  WeatherForecast
//
//  Created by inspectorioN on 8/22/20.
//  Copyright © 2020 Vanalite. All rights reserved.
//

import Foundation

struct WeatherDataSource {
    var date: String = ""
    var descriptionText: String = ""
    var temperature: Float = 0
    var pressure: Int = 0
    var humidity: Int = 0

    var temperatureText: String {
        return "\(String(format: "%.1f", temperature))°C"
    }

    var pressureText: String {
        return "\(pressure)"
    }

    var humidityText: String {
        return "\(humidity)%"
    }

    init() {

    }

    init(withWeatherItem weatherItem: WeatherEntity) {
        self.temperature = weatherItem.temperature
        self.pressure = weatherItem.pressure
        self.humidity = weatherItem.humidity
        self.descriptionText = weatherItem.descriptionText
        let date = Date(timeIntervalSince1970: TimeInterval(weatherItem.timestamp))
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "E, dd MMM yyyy"
        self.date = dateFormatter.string(from: date)
    }
}
