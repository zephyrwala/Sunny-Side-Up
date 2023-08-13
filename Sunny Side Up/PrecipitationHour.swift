//
//  PrecipitationHour.swift
//  Sunny Side Up
//
//  Created by Mayur P on 19/07/23.
//

import SwiftUI
import WeatherKit
import Charts

struct PrecipitationHour: View {
    var hourPrecipitation: [HourWeather]
    var weatherColorIs: Color
//    private var yAxisStride: Double {
//        let minValue = hourPrecipitation.map { $0.humidity }.min() ?? 0
//        let maxValue = hourPrecipitation.map { $0.humidity }.max() ?? 0
//        return (minValue + maxValue) / 2
//    }
     
  

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(12), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatted(date: .omitted, time: .shortened)), y: .value("Rain", hourPrep.precipitationChance.formatted(.percent)))
//                        .symbol(by: .value("High", "Rain in the next few hours"))
                        .interpolationMethod(.monotone)
                }
            }.frame(width: 950, height: 150)
                .foregroundColor(weatherColorIs)
                .chartXAxis{
                    AxisMarks(values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
                }
                .chartYAxis(){
                    AxisMarks(values: .automatic()) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
            }
            


           
        }
    }
}

//struct PrecipitationHour_Previews: PreviewProvider {
//    static var previews: some View {
//        PrecipitationHour()
//    }
//}
