//
//  HumidityHour.swift
//  Sunny Side Up
//
//  Created by Mayur P on 21/07/23.
//

import SwiftUI
import WeatherKit
import Charts

struct HumidityHour: View {
    var hourPrecipitation: [HourWeather]
    var weatherColorIs: Color
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(12), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatted(date: .omitted, time: .shortened)), y: .value("Rain", hourPrep.humidity * 100))
                    
                        .interpolationMethod(.monotone)
                }
            }.frame(width: 950, height: 180)
                .foregroundColor(weatherColorIs)
                .chartXAxis{
                    AxisMarks(values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
                }
                .chartYAxis{
                    AxisMarks(position: .leading) { _ in
                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                            .foregroundStyle(Color.white.opacity(0.6))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
            }

           
        }
    }
}

//struct HumidityHour_Previews: PreviewProvider {
//    static var previews: some View {
//        HumidityHour()
//    }
//}
