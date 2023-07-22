//
//  HomeView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import MapKit
import CoreLocation
import WeatherKit


struct HomeView: View {
    
    @StateObject private var locationManager = LocationManager()
    @State private var weather: Weather?
   
    @State private var cityName = "Loading"
    
    
    let weatherService = WeatherService.shared
    @State private var searchText = ""
    
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $locationManager.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .accentColor(.yellow)
                    .edgesIgnoringSafeArea(.all)
                
                
                LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .center)
                    .opacity(0.9)
                    .edgesIgnoringSafeArea(.all)
//                    .blendMode(.multiply)
                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .center)
                    .opacity(0.4)
                    .edgesIgnoringSafeArea(.all)
                   
                ScrollView(.vertical, showsIndicators: false) {
                   
                        
                        
                        VStack {
//                            HStack {
//
//                                Image(systemName: "location")
//
//                                Text(locationManager.locationName ?? "loading")
//                                    .foregroundColor(.black)
//
//
//
//                            }.foregroundColor(.black)
//                            .padding(.bottom, 56)
                            
                        
                           
                            HStack {
                                Image(systemName: weather?.currentWeather.symbolName ?? "cloud")
                                    .font(.system(size: 30))
                                    .symbolRenderingMode(.palette)
                                    .foregroundStyle(Color.black)
                                   
                                Text(weather?.currentWeather.condition.description ?? "loading")
                                    .font(.system(size: 30))
                                    .foregroundColor(.black)
                                
                            } .padding(.top, 80)
                            Text("\(weather?.currentWeather.temperature.formatted(.measurement(width: .abbreviated, usage: .person)) ?? "..")")
                                .foregroundColor(.black)
                                .font(.system(size: 90))
                                .foregroundColor(.black)
                            
                            HStack(spacing: 18) {
                                Image(systemName: "arrow.up")
                                Text("28°C")
                                    .font(.system(size: 21))
                               
                                Image(systemName: "arrow.down")
                                Text("18°C")
                                    .font(.system(size: 21))
                            }.padding(.bottom, 21)
                                .foregroundColor(.black)
                               
                           
                            
                            Spacer()
                            
                            //MARK: - Hourly chart
                            
                           
                            
                            VStack(alignment: .leading) {
                               
                               
                                ScrollView(.horizontal) {
                                    HStack(spacing: 12) {
                                        if let weather {
                                            let safear =  Array(weather.hourlyForecast.filter({ hourlyWeather in
                                                return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                                            }).prefix(25))
                                            
                                            HourlyCard(hourlyWeather: safear)
                                            
                                           
                                        }
                                    }
                                }
                            }.padding(.top, 21)
                                .padding()
                            
                           //hourly chart^
                          
                            VStack {
                                
                                
                                Text("Rain in the next 6 hours")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .padding(.leading, 25)
                                
                                if let weather {
                                    let safear =  Array(weather.hourlyForecast.filter({ hourlyWeather in
                                        return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                                    }).prefix(24))
                                    
                                  
                                    
                                    PrecipitationHour(hourPrecipitation: safear)
                                }
                                
                            }.padding()
    //                       Spacer()
                            VStack(alignment: .center) {
                                
                                Text("Today")
                                    .foregroundColor(.gray.opacity(0.6))
                                    .padding(.leading, 25)
                                VStack (spacing: 15){
                                    //1
                                    HStack(spacing: 15) {
                                        if let safeWeather = weather?.dailyForecast {
                                            if let sunrise = safeWeather[0].sun.sunrise {
                                                ConditionsCard(currentWeatherCondition: "Sunrise", weatherconditionValue: "\(sunrise.formatted(date: .omitted, time: .shortened))", icons: "sunrise.fill")
                                            }
                                        }
                                       
                                        
                                        if let safeWeather = weather?.dailyForecast {
                                            if let sunrise = safeWeather[0].sun.sunset {
                                                ConditionsCard(currentWeatherCondition: "Sunset", weatherconditionValue: "\(sunrise.formatted(date: .omitted, time: .shortened))", icons: "sunset.fill")
                                            }
                                        }
                                    }
                                    
                                    //2
                                    HStack(spacing: 15) {
                                        
                                        if let safeWeather = weather?.dailyForecast {
                                         
                                            ConditionsCard(currentWeatherCondition: "Rain", weatherconditionValue: "\(safeWeather[0].precipitationChance.formatted(.percent))", icons: "drop.degreesign.fill")
                                            
                                        }
                                        
                                        if let safeWeather = weather?.currentWeather {
                                         
                                            ConditionsCard(currentWeatherCondition: "Humidity", weatherconditionValue: "\(safeWeather.humidity.formatted(.percent))", icons: "humidity.fill")
                                            
                                        }
                                    }
                                }
                            } .padding(.top, 15)
                            
                          
                            
    //                        Spacer()
                       
                            
            //                        VStack {
            //                            ForEach(0 ..< 9) { item in
            //                                WeeklyCard()
            //                            }
            //                        }
                            
                            
                            
                            if let weather {
                                let safear =  Array(weather.hourlyForecast.filter({ hourlyWeather in
                                    return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                                }).prefix(24))
                                
                              
                                
                                HumidityHour(hourPrecipitation: safear)
                                    .padding()
                                    .padding(.top, 21)
                                    .padding(.bottom, 21)
                            }
                                
                            //weekly
                            MoonCard()
                            
                            Spacer()
                            
                            
                           
                        }.padding(.top, 60)
                            .padding(.bottom, 100)
                       
                    }
                
                
                }.edgesIgnoringSafeArea(.all)
                .background(.black)
                .task(id: locationManager.currentLocation) {

    //                 viewModel.checkIfLocationServiceIsEnabled()
                  
                   
                   
                    
                    do {
                        //TODO: - un comment this for actual location
                        if let location = locationManager.currentLocation {
                           
                          //static location 12.97573174471989, 77.60148697323523
                          
                            self.weather = try await weatherService.weather(for: location)
                          
                            print("weather is \(weather)")
    
                     }
                    }catch {
                        print(error)
                    }
                    
                    
            }
                .onAppear{
                    locationManager.checkIfLocationServiceIsEnabled()
    //                viewModel.checkLocationAuth()
                    
            }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            HStack {
                                
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(.yellow)
                                
                                Text(locationManager.locationName ?? "loading")
                                    .foregroundColor(.white)
                                    .font(.subheadline)
                                    .shadow(color: .yellow, radius: 9)
                            }
//                            Text("current")
//                                .font(.system(size: 9))
                        }
                    }
                }
        }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

