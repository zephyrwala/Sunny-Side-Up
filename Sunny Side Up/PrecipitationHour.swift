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
    @AppStorage("temps") var temps: Bool?
  
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
                    
                    LineMark(x: .value("Time", (hourPrep.date.formatAsAbbreviatedTime())), y: .value("Temp", hourPrep.temperature.value))
//                        .symbol(by: .value("High", "Rain in the next few hours"))
                        .symbol{
                         
//                                Text(hourPrep.temperature.formatted())
//                                    .font(.system(.caption2))
//                                    .foregroundColor(weatherColorIs)
//                                    .padding(.bottom, 8)
                            ZStack{
                                Circle()
                                    .foregroundColor(Color.black.opacity(0.75))
                                    .frame(height: 42)
                                    .offset(y: -3)
                                
                            
                                VStack{
                                    Image(systemName: hourPrep.symbolName)
                                        .symbolRenderingMode(.monochrome)
                                        .foregroundStyle(.white)
                                        .opacity(0.9)
//                                        .padding(.top, 1)
                                        .offset(y: 5)
//
                                    
                                    
                                    Text(hourPrep.temperature.formatted())
                                        .font(.system(.caption2))
                                        .foregroundColor(.primary)
                                        .offset(y: 18)
                                   
                                     
//
//                                    Text(hourPrep.precipitationChance.formatted(.percent))
//                                    Text(hourPrep.humidity.formatted(.percent))
//                                    Text(hourPrep.visibility.formatted())
//                                    Text(hourPrep.cloudCover.formatted(.percent))
//                                    Text(hourPrep.wind.speed.formatted())
//                                    Text(hourPrep.apparentTemperature.formatted())
//                                     Text(hourPrep.uvIndex.category.description ?? "lop")
                                    .font(.system(.caption2))
                                    .foregroundColor(.mint)
                                    .padding(.top, 0.5)
                                    //                                            .padding(.bottom, 8)
                                }
                                
                            }
//                                    .padding(.bottom, 8)

                                
//                                Text(hourPrep.date.formatted(date: .omitted, time: .shortened))
//                                    .font(.system(.caption2))
//                                    .padding(.bottom, 8)
//                                    .foregroundColor(.white)
                                
                            
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
                    
//                    LineMark(x: .value("Time", (hourPrep.date.formatAsAbbreviatedTime())), y: .value("Rain", hourPrep.precipitationChance.formatted(.number) ))
                    
                    
                    
                }
            }.frame(width: 1050, height: 175)
//                .chartYScale(domain: [UnitTemperature(rawValue: 0), UnitTemperature(rawValue: 100)])
                .chartYScale(
                    domain: hourPrecipitation.temperatureRange()
                )
            
                .foregroundColor(.mint.opacity(0.9))
                .chartXAxis{
                    AxisMarks(values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.4))
                   
                       AxisValueLabel()
                            .foregroundStyle(Color.gray)
                     }
                    
                }
                .chartYAxis(){
                    AxisMarks(position: .leading, values: .automatic) { _ in
//                       AxisGridLine(centered: true, stroke: StrokeStyle(dash: [1, 2]))
//                            .foregroundStyle(Color.white.opacity(0.2))
                       AxisValueLabel()
                            .foregroundStyle(Color.white.opacity(0.6))
                           
                     }
            }
            
                .chartYAxis(.hidden)
            


           
        }
    }
}

//struct PrecipitationHour_Previews: PreviewProvider {
//    static var previews: some View {
//        PrecipitationHour()
//    }
//}
