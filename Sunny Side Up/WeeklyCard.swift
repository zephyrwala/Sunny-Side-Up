//
//  WeeklyCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import WeatherKit

struct WeeklyCard: View {
    var weeklyWeather : [DayWeather]
    var body: some View {
        ForEach(weeklyWeather, id: \.date) { weeklyWeatherItem in
            HStack(spacing: 40) {
                Text(weeklyWeatherItem.date.formatAsAbbreviatedDay())
                    .foregroundColor(.gray)
                   
                Image(systemName: "\(weeklyWeatherItem.symbolName)")
                    .foregroundColor(.white)
                HStack(spacing: 10) {
                    HStack {
                        Image(systemName: "arrow.up")
                            .foregroundColor(.gray)
                        Text(weeklyWeatherItem.highTemperature.formatted())
                            .foregroundColor(.mint)
                    }
                    
    //                    .font(.system(size: 21))
                    HStack{
                        Image(systemName: "arrow.down")
                            .foregroundColor(.gray)
                        Text(weeklyWeatherItem.lowTemperature.formatted())
                            .foregroundColor(.gray)
                    }
    //                    .font(.system(size: 21))
                }
            }.frame(width: UIScreen.main.bounds.width - 30, height: 66)
            
//                .background(.black.opacity(0.4))
                .background(.ultraThinMaterial.opacity(0.9))
//                .background{
//                    LinearGradient(colors: [.mint, .black], startPoint: .leading, endPoint: .trailing).opacity(0.6)
//                }
//                .blendMode(.multiply)
                .shadow(color: .black.opacity(0.3), radius: 6)
                .cornerRadius(10)
                
            .opacity(0.8)
        }
    }
}

//struct WeeklyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyCard()
//            .previewLayout(.sizeThatFits)
//    }
//}
