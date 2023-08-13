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
    var weatherColorIs: Color
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
            ZStack{
               
                VStack{
                    Spacer()
                   
                    
                }
                
            VStack(spacing: 10) {
                Text(hourlyWeatherItem.date.formatted(date: .omitted, time: .shortened))
                    .font(.system(size: 10))
                    .foregroundColor(.gray)
                Image(systemName: "\(hourlyWeatherItem.symbolName)")
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(Color.white, weatherColorIs)
                    .font(.system(size: 21, weight: .bold))
                //                    .foregroundColor(.white)
                Text(hourlyWeatherItem.precipitationChance.formatted(.percent)).font(.system(size: 12))
                    .foregroundColor(.gray)
                Text(hourlyWeatherItem.temperature.formatted(.measurement(width: .abbreviated, usage: .person)))
                    .font(.system(size: 13))
                    .foregroundColor(weatherColorIs)
            }.frame(width: 80, height: 120)
            
                .background(.ultraThickMaterial.opacity(0.9))
            
                .shadow(color: .black.opacity(0.3), radius: 6)
                .cornerRadius(15)
            
                .opacity(0.8)
                
                
                .overlay {
                    VStack {
                        
                        Spacer(minLength: 0.0)
                    weatherColorIs.opacity(0.036)
                        
                        .frame(width: 80, height: 120 * hourlyWeatherItem.precipitationChance, alignment: .bottom)
                        .cornerRadius(15)
                       
//                        .blendMode(.colorDodge)
                        .padding(0.0)
                    }
                    
                }
            
            
        }
        }
    }
}

//struct HourlyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyCard()
//            .previewLayout(.sizeThatFits)
//    }
//}
