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
                                         y: .value("Temp", weeklyWeatherItem.highTemperature.value), series: .value("High", "High Temperature"))
                                .foregroundStyle(Color.mint.opacity(0.6))
//                                .symbol(by: .value("High", "High Temperature"))
                                .interpolationMethod(.monotone)
                                .symbol{
                                 
      
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color.white.opacity(0.85))
                                            .frame(height: 30)
                                            .offset(y: -3)
                                        
                                    
                                        VStack{
                                            Image(systemName: weeklyWeatherItem.symbolName)
                                                .font(.system(size: 12))
                                                .symbolRenderingMode(.monochrome)
                                                .foregroundStyle(.black)
                                                .opacity(0.9)
        //                                        .padding(.top, 1)
                                                .offset(y: 5)
        //
                                            
                                            
                                            Text(weeklyWeatherItem.highTemperature.formatted())
                                                .font(.system(.caption2))
                                                .foregroundColor(.mint)
                                                .offset(y: -50)
                                           
                                             
      
                                            .font(.system(.caption2))
                                            .foregroundColor(.mint)
                                            .padding(.top, 0.5)
                                            //                                            .padding(.bottom, 8)
                                        }
                                        
                                    }
        //                                    .padding(.bottom, 8)

                                        
    
                                        
                                    
                                }

                                LineMark(x: .value("Day", weeklyWeatherItem.date.formatted(date: .abbreviated, time: .omitted)),
                                         y: .value("sTemp", weeklyWeatherItem.lowTemperature.value), series: .value("Low", "Low Temperature"))
                                .foregroundStyle(Color.white.opacity(0.7))
                                .interpolationMethod(.monotone)
                                .symbol{
                                 
      
                                    ZStack{
                                        Circle()
                                            .foregroundColor(Color.white.opacity(0.85))
                                            .frame(height: 30)
                                            .offset(y: -3)
                                        
                                    
                                        VStack{
                                            Image(systemName: weeklyWeatherItem.symbolName)
                                                .font(.system(size: 12))
                                                .symbolRenderingMode(.monochrome)
                                                .foregroundStyle(.black)
                                                
                                                .opacity(0.9)
        //                                        .padding(.top, 1)
                                                .offset(y: 5)
        //
                                            
                                            
                                            Text(weeklyWeatherItem.lowTemperature.formatted())
                                                .font(.system(.caption2))
                                                .foregroundColor(.primary)
                                                .offset(y: 21)
                                           
                                             
      
                                            .font(.system(.caption2))
                                            .foregroundColor(.mint)
                                            .padding(.top, 0.5)
                                            //                                            .padding(.bottom, 8)
                                        }
                                        
                                    }
        //                                    .padding(.bottom, 8)

                                        
    
                                        
                                    
                                }
                               
                                
       
                            }
                            
                        }.frame(width: 750, height: 270)
                .aspectRatio(contentMode: .fit)
                .chartYScale(
                    domain: weeklyWeather.temperatureRange()
                )
                .chartForegroundStyleScale([
                        "Low Temperature": Color.black,
                        "High Temperature": Color.mint
                        
                    ])
//                .chartLegend(position: .bottom, alignment: .leading, spacing: 16) {
//                            Text("Invoices Payments").foregroundColor(.blue) // just an example View
//                        }
            .chartXAxis(){
                AxisMarks(values: .automatic) { _ in
//                   AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                        .foregroundStyle(Color.white.opacity(0.6))
                   AxisValueLabel()
                        .foregroundStyle(Color.white.opacity(0.6))
                 }
            }
            .chartYAxis{
                AxisMarks(position: .leading) { _ in
                   
                    
//
//                    AxisValueLabel()
//                        .foregroundStyle(Color.white.opacity(0.6))
                        
                 }
        }
        }.padding()
            .scrollIndicators(.hidden)
        
    }
}

//struct WeeklyChart_Previews: PreviewProvider {
//    static var previews: some View {
//        WeeklyChart()
//    }
//}
