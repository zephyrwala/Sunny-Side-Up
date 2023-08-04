//
//  MainWeatherCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 01/08/23.
//

import SwiftUI
import WeatherKit

struct MainWeatherCard: View {
    
    var currentWeather: Weather?
    var weatherColorIs: Color
    
    var body: some View {
        
        
        VStack (alignment: .leading){
            
            HStack {
                Image(systemName: currentWeather?.currentWeather.symbolName ?? "cloud")
                    .font(.system(size: 30))
                    .symbolRenderingMode(.palette)
                    .foregroundStyle(weatherColorIs)
                
                Text(currentWeather?.currentWeather.condition.description ?? "loading")
                    .font(.system(size: 30))
                    .foregroundColor(weatherColorIs)
                
                
            } .padding(.top, 75)
            Text("\(currentWeather?.currentWeather.temperature.formatted(.measurement(width: .abbreviated, usage: .asProvided)) ?? "--")")
                .foregroundColor(weatherColorIs)
                .font(.system(size: 90))
                .fontWeight(.regular)
                .foregroundColor(weatherColorIs)
               
            
            HStack(spacing: 18) {
                Image(systemName: "arrow.up")
                Text("28°C")
                    .font(.system(size: 21))
                
                Image(systemName: "arrow.down")
                Text("18°C")
                    .font(.system(size: 21))
            }.padding(.bottom, 21)
                .foregroundColor(weatherColorIs)
            
        }.padding(.leading, 24)
            .frame(height: 300)    }
}

//struct MainWeatherCard_Previews: PreviewProvider {
//    static var previews: some View {
//        MainWeatherCard(currentWeather: <#Weather#>, weatherColorIs: <#Color#>)
//    }
//}
