//
//  WeeklyChart.swift
//  Sunny Side Up
//
//  Created by Mayur P on 15/07/23.
//

import SwiftUI
import WeatherKit
import Charts

struct WeeklyChart: View {
    var weeklyWeather : [DayWeather]
    
    var body: some View {
        
        ScrollView(.horizontal)  {
            Chart {
                            ForEach(weeklyWeather, id: \.date) { weeklyWeatherItem in
                                
                                LineMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
                                         y: .value("Temp", weeklyWeatherItem.highTemperature.formatted(.measurement(width: .abbreviated, usage: .person))), series: .value("High", "High Temperature"))
                                .foregroundStyle(Color.yellow.opacity(0.6))
                                .symbol(by: .value("High", "High Temperature"))
                                .interpolationMethod(.monotone)

                                LineMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
                                         y: .value("sTemp", weeklyWeatherItem.lowTemperature.formatted(.measurement(width: .abbreviated, usage: .person))), series: .value("Low", "Low Temperature"))
                                .foregroundStyle(Color.black)
                                .interpolationMethod(.monotone)
                                .symbol(by: .value("Low", "Low Temperature"))
                                
                               
                                
                                
                                
//                                BarMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
//                                        y: .value("Temp", weeklyWeatherItem.highTemperature.converted(to: .fahrenheit).value))
//                                .foregroundStyle(Color.yellow.opacity(0.9))
//                                .cornerRadius(12)
//                                .interpolationMethod(.linear)

//                                AreaMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
//                                        y: .value("High", weeklyWeatherItem.highTemperature.formatted(.measurement(width: .narrow, usage: .person))))
//                                .foregroundStyle(Color.yellow.opacity(0.9))
//                                .interpolationMethod(.catmullRom)
//
//                                LineMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
//                                        y: .value("Temp", weeklyWeatherItem.highTemperature.converted(to: .fahrenheit).value))
//
//
//                                .foregroundStyle(Color.yellow.opacity(0.9))
////
//                                .interpolationMethod(.catmullRom)
                                
                            }
                            
                        }.frame(width: 950, height: 270)
                .aspectRatio(contentMode: .fit)
                .chartForegroundStyleScale([
                        "Low Temperature": Color.black,
                        "High Temperature": Color.yellow
                        
                    ])
//                .chartLegend(position: .bottom, alignment: .leading, spacing: 16) {
//                            Text("Invoices Payments").foregroundColor(.blue) // just an example View
//                        }
            .chartXAxis(){
                AxisMarks(values: .automatic) { _ in
                   AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                        .foregroundStyle(Color.white.opacity(0.6))
                   AxisValueLabel()
                        .foregroundStyle(Color.white.opacity(0.6))
                 }
            }
            .chartYAxis{
                AxisMarks(position: .leading) { _ in
                   
                    
                        
                    AxisValueLabel()
                        .foregroundStyle(Color.white.opacity(0.6))
                        
                 }
        }
        }.padding()
        
    }
}

//struct WeeklyChart_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyChart()
//    }
//}
