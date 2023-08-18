//
//  WeatherFetcher.swift
//  Sunny Side Up
//
//  Created by Mayur P on 18/08/23.
//

import Foundation
import WeatherKit
import CoreLocation
import SwiftUI

final class WeatherFetcher: ObservableObject {
    @Published var dailyTemperatures: [DailyTemperature]
   
    @AppStorage ("latits") private var latits = 0.0
    @AppStorage ("longis") private var longis = 0.0
    init(dailyTemperatures: [DailyTemperature] = []) {
        self.dailyTemperatures = dailyTemperatures
    }

    func fetchDaily() async {
        // Stops previews from fetching live weather data
        guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else {
            return
        }

        let weatherService = WeatherService()
        //12.910140, 77.644464
        let melbourne = CLLocation(latitude: latits, longitude: longis)

        do {
            let weather = try await weatherService.weather(for: melbourne)
            
            let dailyForecasts = weather.dailyForecast.forecast
            
            let dailyTemperatures = Array(dailyForecasts.prefix(12)).map {
                DailyTemperature(
                    day: $0.date,
                    min: $0.lowTemperature.value,
                    max: $0.highTemperature.value,
                    id: UUID().uuidString
                )
            }
            
            DispatchQueue.main.async {
                self.dailyTemperatures = dailyTemperatures
            }
        } catch {
            // Would be better to handle the error
            print(error)
        }
    }
}



final class HourlyWeatherFetcher: ObservableObject {
    @Published var dailyTemperatures: [HourlyTemperature]
   
    @AppStorage ("latits") private var latits = 0.0
    @AppStorage ("longis") private var longis = 0.0
    init(dailyTemperatures: [HourlyTemperature] = []) {
        self.dailyTemperatures = dailyTemperatures
    }

    func fetchDaily() async {
        // Stops previews from fetching live weather data
        guard ProcessInfo.processInfo.environment["XCODE_RUNNING_FOR_PREVIEWS"] != "1" else {
            return
        }

        let weatherService = WeatherService()
        //12.910140, 77.644464
        let melbourne = CLLocation(latitude: latits, longitude: longis)

        do {
            let weather = try await weatherService.weather(for: melbourne)
            
            let dailyForecasts = weather.hourlyForecast.forecast
            
            
            for eachTemp in dailyForecasts {
                
                let newObject = HourlyTemperature(day: eachTemp.date, temp: eachTemp.temperature.value, symbol: eachTemp.symbolName, id: UUID().uuidString)
                DispatchQueue.main.async {
                    self.dailyTemperatures.append(newObject)
                }
                
            }
//            let dailyTemperatures = Array(dailyForecasts).map {
//                HourlyTemperature(
//                    day: $0.date,
//                    temp: $0.temperature.value,
//                    symbol: $0.symbolName.value,
//                    id: UUID().uuidString
//                )
//            }
            
          
//                self.dailyTemperatures = dailyTemperatures
//            }
        } catch {
            // Would be better to handle the error
            print(error)
        }
    }
}
