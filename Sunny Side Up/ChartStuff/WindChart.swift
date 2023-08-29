//
//  WindChart.swift
//  Sunny Side Up
//
//  Created by Mayur P on 28/08/23.
//

import SwiftUI
import WeatherKit
import Charts

struct WindChart: View {
    var hourPrecipitation: [HourWeather]
    var weatherColorIs: Color
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(18), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatAsAbbreviatedTime()), y: .value("Wind", hourPrep.wind.speed.value))
                    
                        .interpolationMethod(.catmullRom)
                    
                        .symbol{
                           
                                ZStack{
                                    Circle()
                                        .foregroundColor(Color.black.opacity(0.9))
    //                                    .foregroundColor(.ultraThin)
                                        .frame(height: 42)
//                                        .offset(y: -7)
                                VStack {
                                    
//                                    Text("\(hourPrep.wind.direction.value)" ?? "")
//                                        .font(.system(.caption2))
//                                        .foregroundColor(weatherColorIs)
////                                        .offset(y: 10)
                                        Image(systemName: "location.north")
//                                    Image(systemName: "location.\(hourPrep.wind.direction)")
                                    

                                        .foregroundColor(.white)
                                        .rotationEffect(.degrees(-hourPrep.wind.direction.value))

                                        .opacity(0.9)
                                        .padding(.top, 10)
                                        .padding(.bottom, 10)
                                        .offset(y: 10)
//
                                    
                                    Text("\(hourPrep.wind.speed.formatted())" ?? "")
                                        .font(.system(.caption2))
                                        .foregroundColor(weatherColorIs)
                                        .offset(y: 10)
                                    
                                }
                            }
                        }
                }
            }.frame(width: 1050, height: 175)
                .foregroundColor(.gray)
                .chartYScale(
                    domain: hourPrecipitation.windRange()
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
//
//struct WindChart_Previews: PreviewProvider {
//    static var previews: some View {
//        WindChart()
//    }
//}
