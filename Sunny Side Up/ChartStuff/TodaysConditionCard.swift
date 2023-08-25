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
            Text("It is \(environmentLocationManager.weather?.currentWeather.condition.description ?? "") now with a humidty of \(environmentLocationManager.weather?.currentWeather.humidity.formatted(.percent).description ?? ""). It feels like \(environmentLocationManager.weather?.currentWeather.apparentTemperature.formatted() ?? "") today with cloud cover of \(environmentLocationManager.weather?.currentWeather.cloudCover.formatted(.percent) ?? "")")
                .font(.system(.caption))
                .foregroundColor(.gray)
                .padding()
        }
        .frame(width: UIScreen.screenWidth - 20, height: 90)
        
            .background(.ultraThickMaterial.opacity(0.9))
        
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
