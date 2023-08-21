//
//  DailyTemperature.swift
//  Sunny Side Up
//
//  Created by Mayur P on 18/08/23.
//



import Foundation
import WeatherKit

struct DailyTemperature: Identifiable {
    let day: Date
    let min: Double
    let max: Double
    let id: String
}

extension Array where Element == DailyTemperature {
    func temperatureRange() -> ClosedRange<Int> {
        let min = map(\.min).min() ?? .zero
        let max = map(\.max).max() ?? .zero

        // Will round the min down 4.6 -> 4
        // and round the max up 15.4 -> 16
        return Int(min.rounded(.down))...Int(max.rounded(.up))
    }
}




extension Array where Element == HourlyTemperature {
    func temperatureRange() -> ClosedRange<Int> {
        let min = 0.0
        let max = 100.0

        // Will round the min down 4.6 -> 4
        // and round the max up 15.4 -> 16
        return Int(min.rounded(.down))...Int(max.rounded(.up))
    }
}

extension Array where Element == HourWeather {
    func temperatureRange() -> ClosedRange<Int> {
        let min = 0.0
        let max = map(\.temperature.value).max()  ?? .zero
//        let max = 100.0

        // Will round the min down 4.6 -> 4
        // and round the max up 15.4 -> 16
        return Int(min.rounded(.down))...Int(max.rounded(.up) + 20)
    }
}



struct HourlyTemperature: Identifiable {
    
    
    let day: Date
    let temp: Double
    let symbol: String
    let id: String
}
