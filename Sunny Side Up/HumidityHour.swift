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
                ForEach(hourPrecipitation.prefix(18), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatAsAbbreviatedTime()), y: .value("Rain", hourPrep.humidity * 100))
                    
                        .interpolationMethod(.catmullRom)
                    
                        .symbol{
                           
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.black.opacity(0.75))
    //                                    .foregroundColor(.ultraThin)
                                        .frame(height: 42)
                                        .offset(y: -7)
                                VStack {
                                    
                                    //                                Image(systemName: "\(hourPrep.symbolName)")
                                    Image(systemName: "humidity")
                                    
//                                                                            .symbolRenderingMode(.palette)
//                                                                            .foregroundStyle(Color.white, weatherColorIs, )
                                        .foregroundColor(.white)
                                        .opacity(0.9)
                                        .padding(.top, 10)
                                    
                                    
                                    Text("\(hourPrep.humidity.formatted(.percent))" ?? "")
                                        .font(.system(.caption2))
                                        .foregroundColor(weatherColorIs)
                                    
                                }
                            }
                        }
                }
            }.frame(width: 1050, height: 175)
                .foregroundColor(.gray)
                .chartYScale(
                    domain: hourPrecipitation.humidityRange()
                )
                .chartXAxis{
                    AxisMarks(values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
                }
//                .chartYAxis{
//                    AxisMarks(position: .leading) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
//                       AxisValueLabel()
//                            .foregroundStyle(Color.white.opacity(0.6))
//                     }
//            }

                .chartYAxis(.hidden)
           
        }
    }
}

//struct HumidityHour_Previews: PreviewProvider {
//    static var previews: some View {
//        HumidityHour()
//    }
//}
