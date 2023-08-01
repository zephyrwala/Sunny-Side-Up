//
//  WeatherCard2.swift
//  Sunny Side Up
//
//  Created by Mayur P on 01/08/23.
//

import SwiftUI
import WeatherKit

struct WeatherCard2: View {
    
    var currentWeather: Weather?
    var weatherColorIs: Color

    var body: some View {
       
        VStack{
            
            HStack{
                
                VStack{
                    Text("\(currentWeather?.currentWeather.temperature.formatted(.measurement(width: .abbreviated, usage: .person)) ?? "--")")
                        .foregroundColor(weatherColorIs)
                        .font(.system(size: 65))
                        .fontWeight(.regular)
                        .foregroundColor(weatherColorIs)
                    
                    Text(currentWeather?.currentWeather.condition.description ?? "loading")
                        .font(.system(size: 30))
                        .foregroundColor(weatherColorIs)
                    
                }
                
                Spacer()
                
                VStack {
                    Image(systemName: currentWeather?.currentWeather.symbolName ?? "cloud")
                        .font(.system(size: 99))
                        .symbolRenderingMode(.palette)
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.white.opacity(0.7), weatherColorIs)
                    
                }
                
                
                
            }
            
        }.frame(height: 150)
            .padding(.top, 20)
            .padding(45)
        
        
        
    }
}

//struct WeatherCard2_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherCard2()
//    }
//}
