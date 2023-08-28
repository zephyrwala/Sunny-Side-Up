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
                ForEach(hourPrecipitation.prefix(24), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatAsAbbreviatedTime()), y: .value("UV Index", hourPrep.uvIndex.value))
                    
                        .interpolationMethod(.catmullRom)
                    
                        .symbol{
                           
                            if hourPrep.uvIndex.value >= 1 {
                                
                                ZStack{
                                    
                                    switch hourPrep.uvIndex.category {
                                        
                                        case  .low:
                                        Circle()
                                            .strokeBorder(.green, lineWidth: 3).opacity(0.6)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 39, height: 39)
                                        
                                           
                                        
                               
                                        
                                    case .moderate:
                                        
                                        Circle()
                                            .strokeBorder(.yellow, lineWidth: 3).opacity(0.6)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 39, height: 39)

                                        
                                        
                                        
                                    case .high:
                                        
                                        Circle()
                                            .strokeBorder(.orange, lineWidth: 3).opacity(0.6)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 39, height: 39)

                                        
                                        
                                    case .veryHigh:
                                        
                                        Circle()
                                            .strokeBorder(.red, lineWidth: 3).opacity(0.6)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 39, height: 39)

                                        
                                        
                                    case .extreme:
                                        
                                        Circle()
                                            .strokeBorder(.purple, lineWidth: 3).opacity(0.6)
                                                        .background(
                                                            Circle().fill(.black.opacity(0.9))
                                                        )
                                                        .frame(width: 39, height: 39)

                                    default:
                                        Circle()
                                            .foregroundColor(Color.black.opacity(0.75))
                                            .frame(height: 42)
                                        
                                        
                                        
                                        
                                    }
                                    

                                VStack {
                                    


                                    switch hourPrep.uvIndex.category {
                                    case .low:
                                        Text("low")
                                            .foregroundColor(.green)
                                            .font(.system(size: 8))
                                            .offset(y: -30)
                                           
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.green)
                                            .offset(y: -6)
                                        
                                    case .moderate:
                                        
                                        Text("medium")
                                            .foregroundColor(.yellow)
                                            .font(.system(size: 8))
                                            .offset(y: -30)
                                        
                                        Text("\(hourPrep.uvIndex.value)")
                                            .offset(y: -6)
                                            .foregroundColor(.yellow)
                                    case .high:
                                        Text("high")
                                            .foregroundColor(.orange)
                                            .font(.system(size: 8))
                                            .offset(y: -30)
                                        Text("\(hourPrep.uvIndex.value)")
                                            .offset(y: -6)
                                            .foregroundColor(.orange)
                                    case .veryHigh:
                                        Text("very\nhigh")
                                            .foregroundColor(.red)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: 8))
                                            .offset(y: -30)
                                        
                                        Text("\(hourPrep.uvIndex.value)")
                                            .offset(y: -9)
                                            .foregroundColor(.red)
                                    case .extreme:
                                        Text("extreme")
                                            .foregroundColor(.purple)
                                            .font(.system(size: 8))
                                            .offset(y: -30)
                                        
                                        Text("\(hourPrep.uvIndex.value)")
                                            .foregroundColor(.purple)
                                            .offset(y: -6)
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
