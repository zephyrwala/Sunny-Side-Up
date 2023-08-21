//
//  MapView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 09/07/23.
//

import SwiftUI
import Charts

struct MapView: View {
    @ObservedObject var fetcher: HourlyWeatherFetcher

    init(fetcher: HourlyWeatherFetcher = HourlyWeatherFetcher()) {
        self.fetcher = fetcher
    }

    var body: some View {
        
        VStack {
            Text("Bengaluru Daily Weather")
                .font(.title)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.bottom, 60)

//            ScrollView(.horizontal) {
                Chart(fetcher.dailyTemperatures) { daily in
                    // Can replace with BarMark, RuleMark, and AreaMark
//                    RuleMark(
//                        x: .value("Day", daily.day, unit: .day),
//                        yStart: .value("High temperature", daily.max),
//                        yEnd: .value("Low temperature", daily.min)
//                    )
//                    .foregroundStyle( LinearGradient(gradient: Gradient(colors: [.yellow, .blue]), startPoint: .top, endPoint: .bottom))
//                    .lineStyle(StrokeStyle(lineWidth: 3.6))
                    
                    //                LineMark(
                    //                    x: .value("Day", daily.day, unit: .day),
                    //                    y: .value("High temperature", daily.max),
                    ////                    yEnd: .value("Low temperature", daily.min)
                    //                )
                    
//                    PointMark(
//                        x: .value("Day", daily.day, unit: .day),
//                        y: .value("Low temperature", daily.min)
//                    )
////                    .foregroundStyle(by: .value("Low", daily.min))
//                                    .foregroundStyle(.blue)
//
//
//                    PointMark(
//                        x: .value("Day", daily.day, unit: .day),
//                        y: .value("High temperature", daily.max)
//                    )
////                          x          .foregroundStyle(by: .value("High", daily.max))
//                    .foregroundStyle(.yellow)
                    //                .symbol{
                    //                    Image(systemName: "arrow.up")
                    //                        .foregroundColor(.pink)
                    //                }
                    
                    LineMark(x: .value("Day", daily.day, unit: .day), y: .value("High temperature", daily.temp))
                        
                    
                }
                .chartYScale(
                    domain: fetcher.dailyTemperatures.temperatureRange()
                )
            
                .chartYAxis {
                    AxisMarks(position: .leading)
                }
                .frame( height: 250)
//            }
        }
        
        .padding(.all, 16)
        .task {
            await fetcher.fetchDaily()
        }
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}


extension Date {
    static func date(year: Int, month: Int, day: Int) -> Date {
        Calendar.current.date(
            from: DateComponents(year: year, month: month, day: day)
        ) ?? Date()
    }
}
