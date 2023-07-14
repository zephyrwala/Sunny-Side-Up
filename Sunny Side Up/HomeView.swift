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
        
        ZStack {
            Map(coordinateRegion: $locationManager.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .accentColor(.yellow)
                .edgesIgnoringSafeArea(.all)
            
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .center)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .center)
                .opacity(0.2)
                .edgesIgnoringSafeArea(.all)
               
            ScrollView(.vertical) {
               
                    
                    
                    VStack {
                        HStack {
                            
                            Image(systemName: "location")
                            
                            Text(locationManager.locationName ?? "loading")
                                .foregroundColor(.black)
                           
                            
                            
                        }.foregroundColor(.black)
                        .padding(.bottom, 56)
                        
                    
                       
                        HStack {
                            Image(systemName: weather?.currentWeather.symbolName ?? "cloud")
                                .font(.system(size: 30))
                                .symbolRenderingMode(.palette)
                                .foregroundStyle(Color.black)
                               
                            Text(weather?.currentWeather.condition.description ?? "loading")
                                .font(.system(size: 30))
                                .foregroundColor(.black)
                            
                        }
                        Text("\(weather?.currentWeather.temperature.formatted(.measurement(width: .abbreviated, usage: .asProvided)) ?? "10")")
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
                        
//                       Spacer()
                        VStack(alignment: .leading) {
                            
                            Text("Today's Conditions")
                                .foregroundColor(.gray.opacity(0.6))
                                .padding(.leading, 25)
                            ScrollView(.horizontal) {
                                LazyHGrid(rows: twoColumnGrid, spacing: 10) {
                                       // Display the item
                                    ForEach(0...30, id: \.self) { item in
                                        ConditionsCard()
                                    }
                                    
                                }.padding()
                                    .frame(height: 220)
                                   
                            }
                        } .padding(.top, 15)
                        
//                        Spacer()
                   
                        
        //                        VStack {
        //                            ForEach(0 ..< 9) { item in
        //                                WeeklyCard()
        //                            }
        //                        }
                        
                        
                        //weekly
                        
                        Spacer()
                        
                        
                       
                    }.padding(.top, 60)
                        .padding(.bottom, 100)
                   
                }
            
            
            }.edgesIgnoringSafeArea(.all)
            .background(.black)
            .task(id: locationManager.currentLocation) {

//                 viewModel.checkIfLocationServiceIsEnabled()
              
               
               
                
                do {
                    if let location = locationManager.currentLocation {
                       
                      
                        self.weather = try await weatherService.weather(for: location)
                        print("weather is \(weather)")
//                        geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error -> Void in
//
//                            // Place details
//                            guard let placeMark = placemarks?.first else { return }
//
//                            if let safeLocation = placeMark.subAdministrativeArea {
//                                print("Location name - \(safeLocation)")
//
//                                self.cityName = safeLocation
//                            }
//
//
//
//                        })
                    }
                }catch {
                    print(error)
                }
                
                
        }
            .onAppear{
                locationManager.checkIfLocationServiceIsEnabled()
//                viewModel.checkLocationAuth()
                
            }
        
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

