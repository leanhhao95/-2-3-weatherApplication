//
//  weather.swift
//  custom2Weather
//
//  Created by Hao on 9/26/17.
//  Copyright © 2017 Hao. All rights reserved.
//
import Foundation
struct Weather: Codable {
    let location: Location
    let current: Current
    let forecast: Forecast
}
struct Location: Codable {
    let name: String
}
struct Current: Codable {
    let temp_c: Double
    let condition: Condition
}
struct Forecast: Codable {
    let forecastday:[ForecastDay]
}

struct ForecastDay: Codable {
    let day: Day
    let date_epoch: TimeInterval
}

struct Day: Codable {
    let maxtemp_c: Double
    let mintemp_c: Double
    let condition: Condition
}
struct Condition: Codable {
    let icon: String
    let text: String
}
