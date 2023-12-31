//
//  TodaysConditionCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 25/08/23.
//

import SwiftUI
import WeatherKit

struct TodaysConditionCard: View {
    
    @EnvironmentObject var environmentLocationManager: LocationManager
    var body: some View {
        VStack {
            
            
            Text("Right now it is ") .font(.system(.caption)).foregroundColor(.primary)
            
            + Text(environmentLocationManager.weather?.currentWeather.condition.description ?? "").foregroundColor(.mint) .font(.system(.caption))
           
            + Text(" with a max of \(environmentLocationManager.weather?.dailyForecast[0].highTemperature.formatted() ?? "") and min of \(environmentLocationManager.weather?.dailyForecast[0].lowTemperature.formatted() ?? "").")
                .font(.system(.caption)).foregroundColor(.primary)
            
            + Text(" It feels like ").font(.system(.caption)).foregroundColor(.primary) + Text(environmentLocationManager.weather?.currentWeather.apparentTemperature.formatted() ?? "").foregroundColor(.mint) .font(.system(.caption)) + Text(" right now with cloud cover of \(environmentLocationManager.weather?.currentWeather.cloudCover.formatted(.percent) ?? "")")
            .font(.system(.caption))
            .foregroundColor(.primary)
            
            + Text(" & with a humidty of \(environmentLocationManager.weather?.currentWeather.humidity.formatted(.percent).description ?? "")")
                .font(.system(.caption)).foregroundColor(.primary)
           
                
                
        }
        .padding()
        .frame(width: UIScreen.screenWidth - 20, height: 100)
        
            .background(.ultraThickMaterial.opacity(0.99))
        
            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
            
            .opacity(0.8)
       
    }
}

struct TodaysConditionCard_Previews: PreviewProvider {
    static var previews: some View {
        TodaysConditionCard()
    }
}
