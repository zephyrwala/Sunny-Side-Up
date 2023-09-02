//
//  WeatherPicker.swift
//  Sunny Side Up
//
//  Created by Mayur P on 23/08/23.
//

import SwiftUI

struct WeatherPicker: View {
    var pickerWeatherConditions: [ConditionItems]
    var pickerCOnditions = ["cloud.rain", "humidity9009", "thermometer.sun", "eye", "wind"]
    @State private var selectedWeather = 0
    var body: some View {
      
            HStack{
               
                ScrollView{
                    HStack{
                        Picker("Conditions", selection: $selectedWeather) {
                          
                                
                             
        //                                /*@START_MENU_TOKEN@*/Text(condition.condition)/*@END_MENU_TOKEN@*/
                                    Image(systemName: "cloud.rain").tag(0)
                            Image(systemName: "humidity").tag(1)
                            Image(systemName: "thermometer.sun").tag(2)
                            Image(systemName: "cloud.rain").tag(3)
                                    
                              
                            .pickerStyle(.segmented)
                        }
                    }
                 
                }
              
                .pickerStyle(.segmented)
                .frame(width: 460)
            
        }
    }
}

//struct WeatherPicker_Previews: PreviewProvider {
//    static var previews: some View {
//        WeatherPicker()
//    }
//}
