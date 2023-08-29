//
//  SunStuffCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 29/08/23.
//

import SwiftUI
import WeatherKit

struct SunStuffCard: View {
    
    
    @EnvironmentObject var environmentLocationManager: LocationManager
    var body: some View {
        VStack {
            
            
            Text("UV Index right now is ") .font(.system(.caption)).foregroundColor(.gray) + Text(environmentLocationManager.weather?.currentWeather.uvIndex.value.description ?? "").foregroundColor(.yellow) .font(.system(.caption))
            
            +  Text(" ")
            
            + Text(environmentLocationManager.weather?.currentWeather.uvIndex.category.description ?? "").foregroundColor(.yellow) .font(.system(.caption))
            +
            
            Text(" with the current temperature of ")
            
                .font(.system(.caption))
                .foregroundColor(.gray)
            
            +   Text(environmentLocationManager.weather?.currentWeather.temperature.formatted() ?? "").foregroundColor(.yellow) .font(.system(.caption))
                
        }
        .padding()
        .frame(width: UIScreen.screenWidth - 20, height: 90)
        
            .background(.ultraThickMaterial.opacity(0.9))
        
            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
            
            .opacity(0.8)
       
    }
}

struct SunStuffCard_Previews: PreviewProvider {
    static var previews: some View {
        SunStuffCard()
    }
}
