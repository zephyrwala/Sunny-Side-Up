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
    private var yAxisStride: Double {
        let minValue = hourPrecipitation.map { $0.humidity }.min() ?? 0
        let maxValue = hourPrecipitation.map { $0.humidity }.max() ?? 0
        return (minValue + maxValue) / 2
    }
     
  

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(6), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatted(date: .omitted, time: .shortened)), y: .value("Rain", hourPrep.precipitationChance.formatted(.percent)))
                    
                        .interpolationMethod(.monotone)
                }
            }.frame(width: 350, height: 180)
                .foregroundColor(.yellow)
//                .chartYAxis {
//                    let consumptions = hourPrecipitation.map { $0.temperature.formatted() }
//                    let min = consumptions.min()!
//                    let max = consumptions.max()!
//                    let consumptionStride = Array(stride(from: min,
//                                                            through: max,
//                                                         by: (max - min)/1.0))
//                    AxisMarks(position: .trailing, values: consumptionStride) { axis in
//                        let value = consumptionStride[axis.index]
//                        AxisValueLabel("\(String(format: "%.2F", value)) kWh", centered: false)
//                    }
//                }
//                .chartYAxis {
//
//                    AxisMarks(format: .percent)
////                    AxisMarks(position: .leading, values: .stride(by: yAxisStride)) { value in
////                        AxisGridLine()
////
////                    }
//                }
           
        }
    }
}

//struct PrecipitationHour_Previews: PreviewProvider {
//    static var previews: some View {
//        PrecipitationHour()
//    }
//}
