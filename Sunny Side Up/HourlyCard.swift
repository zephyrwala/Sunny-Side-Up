//
//  HourlyCard.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import WeatherKit

struct HourlyCard: View {
    
   
    var hourlyWeather: [HourWeather]
    var weatherColorIs: Color
//
//        if let weather {
//            return Array(weather.hourlyForecast.filter({ hourlyWeather in
//                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
//            }).prefix(24))
//        }else {
//            return []
//        }
//
//
//    }
  
    var body: some View {
        
        ForEach(hourlyWeather, id: \.date.timeIntervalSinceReferenceDate) { hourlyWeatherItem in
            
            if hourlyWeatherItem.uvIndex.value > 0 {
                ZStack{
    //                Text(hourlyWeatherItem.uvIndex.value.description)
                    Text(hourlyWeatherItem.date.formatAsAbbreviatedTime())
                        .offset(y: 80)
                        .foregroundColor(.gray)
                        .font(.system(.caption))
                    VStack{
                        
                        Spacer()
                       
                        
                    }
                    
                VStack(spacing: 12) {
//                    Text(hourlyWeatherItem.uvIndex.value.description)
//                        .font(.system(size: 10))
//                        .foregroundColor(.gray)
//                        .padding(.top, 10)
                    Spacer()
//                    Image(systemName: "\(hourlyWeatherItem.symbolName)")
//                        .symbolRenderingMode(.palette)
//                        .foregroundStyle(Color.white, weatherColorIs)
//                        .font(.system(size: 21, weight: .bold))
//                        .frame(height: 50)
                    //                    .foregroundColor(.white)
    //                Text(hourlyWeatherItem.precipitationChance.formatted(.percent)).font(.system(size: 12))
    //                    .foregroundColor(.gray)
//                    Text(hourlyWeatherItem.temperature.formatted(.measurement(width: .abbreviated, usage: .person)))
//                        .font(.system(size: 13))
//                        .foregroundColor(weatherColorIs)
                    
                }.frame(width: 30, height: 130)
                
                    .background(.ultraThickMaterial.opacity(0.9))
                
                    .shadow(color: .black.opacity(0.3), radius: 6)
                    .cornerRadius(15)
                
                    .opacity(0.8)
                    
                    
                    .overlay {
                        
                            switch hourlyWeatherItem.uvIndex.category {
                                
                            case .low:
                                
                                VStack {
    //                                Text("Yo")
                                    Spacer(minLength: 0.0)
                                    Text(hourlyWeatherItem.uvIndex.value.description)
                                        .font(.system(size: 10))
                                        .foregroundColor(.green)
//                                        .padding(.top, 10)
                              
                                Color.green.opacity(0.9)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .shadow(color: .green, radius: 5,x: 0, y: -15 )
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                            
                        case .moderate:
                            VStack {
                                
                               
                                Spacer(minLength: 0.0)
                                Text(hourlyWeatherItem.uvIndex.value.description)
                                    .font(.system(size: 10))
                                    .foregroundColor(.yellow)
    //                            Text("Yo")
//                                    Color.yellow.opacity(0.9)
                                LinearGradient(gradient: Gradient(colors: [.yellow, .green]), startPoint: .top, endPoint: .bottom)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                            
                        case .high:
                            VStack {
                                
                               
                                Spacer(minLength: 0.0)
                                Text(hourlyWeatherItem.uvIndex.value.description)
                                    .font(.system(size: 10))
                                    .foregroundColor(.orange)
                                
                                LinearGradient(gradient: Gradient(colors: [.orange, .yellow]), startPoint: .top, endPoint: .bottom)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                            
                        case .veryHigh:
                            VStack {
                                
                                Spacer(minLength: 0.0)
                              
                                Text(hourlyWeatherItem.uvIndex.value.description)
                                    .font(.system(size: 10))
                                    .foregroundColor(.red)
                                
                                LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                            
                        case .extreme:
                            VStack {
                                
                                Spacer(minLength: 0.0)
                               
                                Text(hourlyWeatherItem.uvIndex.value.description)
                                    .font(.system(size: 10))
                                    .foregroundColor(.purple)
                                
                                LinearGradient(gradient: Gradient(colors: [.purple, .red]), startPoint: .top, endPoint: .bottom)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                            
                        default:
                            VStack {
                                
                                Spacer(minLength: 0.0)
                                weatherColorIs.opacity(0.76)
                                
                                    .frame(width: 30, height: 10.0 * CGFloat(hourlyWeatherItem.uvIndex.value), alignment: .bottom)
                                    .cornerRadius(15)
                                
                                //                        .blendMode(.colorDodge)
                                    .padding(0.0)
                            }
                        }
                        
                    }
                    }
                .frame(height: 180)
                
            } else {
                
                ZStack{
    //                Text(hourlyWeatherItem.uvIndex.value.description)
                    Text(hourlyWeatherItem.date.formatAsAbbreviatedTime())
                        .offset(y: 80)
                        .foregroundColor(.gray)
                        .font(.system(.caption))
                    VStack{
                        
                        Spacer()
                       
                        
                    }
                    
                VStack(spacing: 12) {
//                    Text(hourlyWeatherItem.uvIndex.value.description)
//                        .font(.system(size: 10))
//                        .foregroundColor(.gray)
                    Spacer()
                    Image(systemName: "\(hourlyWeatherItem.symbolName)")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.white, .cyan)
                        .opacity(0.6)
                        .font(.system(size: 12, weight: .bold))
                        .frame(height: 25)
                        .padding(.bottom)
                    
                    //                    .foregroundColor(.white)
    //                Text(hourlyWeatherItem.precipitationChance.formatted(.percent)).font(.system(size: 12))
    //                    .foregroundColor(.gray)
//                    Text(hourlyWeatherItem.temperature.formatted(.measurement(width: .abbreviated, usage: .person)))
//                        .font(.system(size: 9))
//                        .foregroundColor(weatherColorIs)
                    
                }.frame(width: 30, height: 130)
                
                    .background(.ultraThickMaterial.opacity(0.9))
                
                    .shadow(color: .black.opacity(0.3), radius: 6)
                    .cornerRadius(15)
                
                    .opacity(0.8)
                    
                    
      
                    }
                .frame(height: 180)
                
            }
            
          
            
            
        }
        }
    }


//struct HourlyCard_Previews: PreviewProvider {
//    static var previews: some View {
//        HourlyCard()
//            .previewLayout(.sizeThatFits)
//    }
//}



extension UIScreen{
   static let screenWidth = UIScreen.main.bounds.size.width
   static let screenHeight = UIScreen.main.bounds.size.height
   static let screenSize = UIScreen.main.bounds.size
}
