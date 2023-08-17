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
                ForEach(hourPrecipitation.prefix(18), id: \.date.timeIntervalSinceReferenceDate) { hourPrep in
                    
                    //TODO: - This is the working line chart
                    
//                    AreaMark(
//                                x: .value("Time", hourPrep.date.formatted(date: .omitted, time: .shortened)),
//                                y: .value("Rain", hourPrep.precipitationChance.formatted(.number))
//                            )
                    var newValues = [Double]()
//                    newValues.append(hourPrep.temperature.converted(to: <#T##UnitTemperature#>))
                    
                    LineMark(x: .value("Time", hourPrep.date.formatted(date: .omitted, time: .shortened)), y: .value("Rain", hourPrep.temperature.formatted()))
//                        .symbol(by: .value("High", "Rain in the next few hours"))
                        .symbol{
                            VStack{
                                Text(hourPrep.temperature.formatted())
                                    .font(.system(.caption2))
                                    .foregroundColor(weatherColorIs)
                                    .padding(.bottom, 8)
                                
                               
                                Image(systemName: "\(hourPrep.symbolName).fill")
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.white, weatherColorIs)
                                    .opacity(0.9)
                                    .padding(.bottom, 8)

                                
//                                Text(hourPrep.date.formatted(date: .omitted, time: .shortened))
//                                    .font(.system(.caption2))
//                                    .padding(.bottom, 8)
//                                    .foregroundColor(.white)
                                
                            }.padding()
                        }
                        .interpolationMethod(.catmullRom)
                    
//
//                    AreaMark(
//                        x: .value("time", hourPrep.date.formatted(date: .omitted, time: .shortened)),
//                        yStart: .value("rainStart", hourPrep.precipitationChance.formatted(.percent)),
//                        // get the max close value or adjust to your use case
//                        yEnd: .value("rainEnd", hourPrep.max{ $0.close > $1.close }!)
//                    )
//                    .interpolationMethod(.catmullRom)
                    
                    
                    
                }
            }.frame(width: 1050, height: 240)
//                .chartYScale(domain: [UnitTemperature(rawValue: 0), UnitTemperature(rawValue: 100)])
                .foregroundColor(weatherColorIs.opacity(0.35))
                .chartXAxis{
                    AxisMarks(values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.6))
                   
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                     }
                    
                }
                .chartYAxis(){
                    AxisMarks(values: .automatic) { _ in
                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
                            .foregroundStyle(Color.white.opacity(0.2))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.0))
                           
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
