//
//  ChartComponent.swift
//  Sunny Side Up
//
//  Created by Mayur P on 23/08/23.
//

import SwiftUI
import WeatherKit

struct ChartComponent: View {
    @State private var showHumid = true
    var conditions: [ConditionItems]
    var hourPrecipitation: [HourWeather]
    @State var showHumidty = false
    var weatherColorIs: Color
    var body: some View {
        VStack{
          
            if showHumidty {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        HumidityHour(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                }} else {
                    ScrollView(.horizontal, showsIndicators: false){
                        HStack{
                            
                            PrecipitationHour(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                        }
                       
                        
                    }
            }
         
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {

                    WeatherConditionsBtn(weatherConditions: conditions, showHumidty: $showHumidty)

//                    WeatherPicker(pickerWeatherConditions: conditions)
                }

            }
            
       
//                    WeatherPicker(pickerWeatherConditions: conditions)
          
           
            .padding(.leading, 9)
            .padding(.trailing, 9)
            .padding(.top, 25)
        }
       
    }
}

//struct ChartComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartComponent()
//    }
//}
