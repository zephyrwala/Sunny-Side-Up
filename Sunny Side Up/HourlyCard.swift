//
//  HourlyCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import WeatherKit

struct HourlyCard: View {
    
   
    var hourlyWeather: [HourWeather] 
//
//        if let weather {
//            return Array(weather.hourlyForecast.filter({ hourlyWeather in
//                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
//            }).prefix(24))
//        }else {
//            return []
//        }
//
//
//    }
  
    var body: some View {
        
        ForEach(hourlyWeather, id: \.date.timeIntervalSinceReferenceDate) { hourlyWeatherItem in
            VStack(spacing: 10) {
                Text(hourlyWeatherItem.date.formatted(date: .omitted, time: .shortened))
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Image(systemName: "\(hourlyWeatherItem.symbolName).fill")
                    .foregroundColor(.white)
                Text(hourlyWeatherItem.temperature.formatted(.measurement(width: .narrow, usage: .asProvided)))
                    .font(.system(size: 13))
                    .foregroundColor(.yellow)
            }.frame(width: 80, height: 90)
                .background(.black.opacity(0.4))
                .shadow(color: .black.opacity(0.3), radius: 6)
                .cornerRadius(15)
            .opacity(0.8)
        }
    }
}

//struct HourlyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyCard()
//            .previewLayout(.sizeThatFits)
//    }
//}
