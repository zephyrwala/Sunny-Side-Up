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
    @State var selectedNumber = 0
    var weatherColorIs: Color
    var body: some View {
        VStack{
          
//            Text("Selected Stuff : \(selectedNumber)")
//            if showHumidty {
//                } else {
//                
//            }
         
            //NOTE: - Excellent way to get this done
            switch selectedNumber {
              
            case 0:
                //MARK: - Temp
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        
                        PrecipitationHour(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                   
                    
                }
                
            case 1:
                
                //MARK: - Humidity
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        HumidityHour(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                }
                
            case 2:
                //MARK: - UV Index
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        UVindexChart(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                }
                
            case 3:
                //MARK: - UV Index
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        RainChartView(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                }
                
            case 4:
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        WindChart(hourPrecipitation: hourPrecipitation, weatherColorIs: weatherColorIs)
                    }
                }
                   
            default:
                    Text("bro!")
            }
            
            
            
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {

                    WeatherConditionsBtn(weatherConditions: conditions, selectedStuff: $selectedNumber, showHumidty: $showHumidty)

//                    WeatherPicker(pickerWeatherConditions: conditions)
                }

            }
            
       
//                    WeatherPicker(pickerWeatherConditions: conditions)
          
           
            .padding(.leading, 9)
            .padding(.trailing, 9)
            .padding(.top, 25)
            
            TodaysConditionCard()
                .padding(.top, 15)
        }
       
    }
}

//struct ChartComponent_Previews: PreviewProvider {
//    static var previews: some View {
//        ChartComponent()
//    }
//}
