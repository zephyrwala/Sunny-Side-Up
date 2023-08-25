//
//  RainChartView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 25/08/23.
//

import SwiftUI
import WeatherKit
import Charts

struct RainChartView: View {
    
    
    var hourPrecipitation: [HourWeather]
    var weatherColorIs: Color
    
    var body: some View {
        
        
        ScrollView(.horizontal, showsIndicators: false) {
            Chart {
                ForEach(hourPrecipitation.prefix(18), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    LineMark(x: .value("Time", hourPrep.date.formatAsAbbreviatedTime()), y: .value("Rain", hourPrep.precipitationChance * 100))
                    
                        .interpolationMethod(.catmullRom)
                    
                        .symbol{
                           
                                ZStack{
                                    if hourPrep.precipitationChance >= 0.10 {
                                    Circle()
                                        .foregroundColor(Color.black.opacity(0.75))
    //                                    .foregroundColor(.ultraThin)
                                        .frame(height: 42)
//                                        .offset(y: -7)
                                    
                                        
                                        VStack {
                                            
                                            //                                Image(systemName: "\(hourPrep.symbolName)")
                                            Image(systemName: "\(hourPrep.symbolName)")
                                            

                                                .foregroundColor(.white)
                                                .opacity(0.9)
                                                .padding(.top, 10)
                                                .padding(.bottom, 10)
                                                .offset(y: 10)
                                            
                                            
                                            Text("\(hourPrep.precipitationChance.formatted(.percent))" ?? "po")
                                                .font(.system(.caption2))
                                                .foregroundColor(weatherColorIs)
                                                .offset(y: 10)
                                            
                                        }
                                        
                                    }
                             
                            }
                        }
                }
            }.frame(width: 1050, height: 175)
                .foregroundColor(.blue)
                .chartYScale(
                    domain: hourPrecipitation.rainRange()
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

//struct RainChartView_Previews: PreviewProvider {
//    static var previews: some View {
//        RainChartView()
//    }
//}
