//
//  WeekView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 09/07/23.
//

import SwiftUI
import WeatherKit
import MapKit

struct WeekView: View {
    
    
   
    @State private var weather: Weather?
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @StateObject private var locationManger = LocationManager()
    @StateObject private var weatherManager = LocalWeatherManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
                Map(coordinateRegion: $locationManger.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .edgesIgnoringSafeArea(.all)
                
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.9), .black]), startPoint: .top, endPoint: .center)
//                                .blendMode(.multiply)
                    .opacity(0.9)
                    .edgesIgnoringSafeArea(.all)
                //                .blendMode(.multiply)
                ScrollView(showsIndicators: false) {
                    
                    VStack{
//                    HStack {
//
//                        Image(systemName: "location")
//
//                        Text(locationManger.locationName ?? "fetching location")
//                            .foregroundColor(.black)
//
//
//
//                    }
//                    .padding(.bottom, 56)
                        if let saferWeather = weather {
                            WeeklyChart(weeklyWeather: saferWeather.dailyForecast.forecast)
//                             .frame(height: 300)
                             .foregroundColor(.black)
                             
                        }
                      
                    VStack(spacing: 15) {
                        Spacer()
                        if let safeWeather = weather {
                            WeeklyCard(weeklyWeather: safeWeather.dailyForecast.forecast)
                        }
                            
                        
                    }.padding(.bottom, 45)
                    }.padding(.top, 12)
                }
               
            }
            
            .task(id: locationManger.currentLocation) {
                if let safeLocation = locationManger.currentLocation {
                    do {
                        self.weather = try await weatherManager.getWeather(location: safeLocation)
                    }catch {
                        print("Error in weather fetch \(error)")
                    }
                }
                
                
        }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            HStack {
                                
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(.yellow)
                                
                                Text(locationManger.locationName ?? "loading")
                                    .foregroundColor(.white)
                            }
//                            Text("current").font(.subheadline)
                        }
                    }
                }
                
        }
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView()
    }
}



