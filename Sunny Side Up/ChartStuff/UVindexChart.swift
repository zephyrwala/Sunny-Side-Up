//
//  UVindexChart.swift
//  Sunny Side Up
//
//  Created by Mayur P on 25/08/23.
//

import SwiftUI
import WeatherKit
import Charts

struct UVindexChart: View {
    var hourPrecipitation: [HourWeather]
    var weatherColorIs: Color
    
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(18), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatAsAbbreviatedTime()), y: .value("UV Index", hourPrep.uvIndex.value))
                    
                        .interpolationMethod(.catmullRom)
                    
                        .symbol{
                           
                            if hourPrep.uvIndex.value >= 1 {
                                
                                ZStack{
                                    
                                    switch hourPrep.uvIndex.category {
                                        
                                        case  .low:
                                        Circle()
                                            .strokeBorder(.green, lineWidth: 2)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 42, height: 42)
                                        
                                           
                                        
                               
                                        
                                    case .moderate:
                                        
                                        Circle()
                                            .strokeBorder(.yellow, lineWidth: 2)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 42, height: 42)

                                        
                                        
                                        
                                    case .high:
                                        
                                        Circle()
                                            .strokeBorder(.orange, lineWidth: 2)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 42, height: 42)

                                        
                                        
                                    case .veryHigh:
                                        
                                        Circle()
                                            .strokeBorder(.red, lineWidth: 2)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 42, height: 42)

                                        
                                        
                                    case .extreme:
                                        
                                        Circle()
                                            .strokeBorder(.purple, lineWidth: 2)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 42, height: 42)

                                    default:
                                        Circle()
                                            .foregroundColor(Color.black.opacity(0.75))
                                            .frame(height: 42)
                                        
                                        
                                        
                                        
                                    }
                                    

                                VStack {
                                    


                                    switch hourPrep.uvIndex.category {
                                    case .low:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.green)
                                    case .moderate:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.yellow)
                                    case .high:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.orange)
                                    case .veryHigh:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.red)
                                    case .extreme:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.purple)
                                        
                                    default:
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.red)
                                    }
                                   
                                    
                                   
                                    
                                }
//                                .offset(y: -21)
                            }
                                
                            }
                              
                        }
                }
            }.frame(width: 1050, height: 175)
                .foregroundColor(.gray)
                .chartYScale(
                    domain: hourPrecipitation.uvindexRange()
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

//struct UVindexChart_Previews: PreviewProvider {
//
//
//
//    static var previews: some View {
//        UVindexChart()
//    }
//}
