//
//  LocalWeatherManager.swift
//  Sunny Side Up
//
//  Created by Mayur P on 14/07/23.
//

import Foundation
import WeatherKit
import MapKit


@MainActor class LocalWeatherManager: NSObject, ObservableObject {
    
    @Published var weather : Weather?
    let weatherService = WeatherService.shared
    var localWeather = ""
    
    
    func getWeather(location: CLLocation) async throws -> Weather? {
        var safeWeather : Weather?
        do {
            
            self.weather = try await weatherService.weather(for: location)
            safeWeather = self.weather
           
            print("WEATHER view model works \(weather)")
            return weather!
            
        } catch {
            print("error in weather fetch \(error)")
        }
        
        return nil
    }
    
    var temp: String {
          let temp =
          weather?.currentWeather.temperature
          
          let convert = temp?.converted(to: .celsius).description
          return convert ?? "Loading Weather Data"
          
      }
    
    
}