//
//  ConditionsCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import WeatherKit


struct ConditionsCard: View {
    var currentWeatherCondition: String?
    var weatherconditionValue: String?
    var icons: String?
    @State private var dayWeatherStuff: DayWeather?
    var body: some View {
        
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Image(systemName: icons ?? "wind")
                    .foregroundColor(.yellow)
                Text(weatherconditionValue ?? "fetching")
                    .foregroundColor(.white)
            }
            
            Text(currentWeatherCondition ?? "fetching")
                .foregroundColor(.gray)
        }.frame(width: 170, height: 90)
            .background(.black.opacity(0.5))
//            .shadow(color: .black.opacity(0.3), radius: 6)
            .cornerRadius(15)
         
            .opacity(0.8)
           
    }
}

struct ConditionsCard_Previews: PreviewProvider {
    static var previews: some View {
        ConditionsCard()
            .previewLayout(.sizeThatFits)
    }
}
