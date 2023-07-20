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
                                         y: .value("Temp", weeklyWeatherItem.highTemperature.formatted()), series: .value("High", "High"))
                                .foregroundStyle(Color.yellow.opacity(0.6))
                                .interpolationMethod(.linear)
                                
                                LineMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
                                         y: .value("Temp", weeklyWeatherItem.lowTemperature.formatted()), series: .value("Low", "Low"))
                                .foregroundStyle(Color.black)
                                .interpolationMethod(.linear)

                                
                            }
                            
                        }.frame(width: 900, height: 270)
               
            .chartXAxis{
                AxisMarks(values: .automatic) { _ in
                   AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                        .foregroundStyle(Color.white.opacity(0.6))
                   AxisValueLabel()
                        .foregroundStyle(Color.white.opacity(0.6))
                 }
            }
            .chartYAxis{
                AxisMarks(values: .automatic()) { _ in
                   AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                        .foregroundStyle(Color.white.opacity(0.6))
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
