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
        ZStack {
            Map(coordinateRegion: $locationManger.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                .edgesIgnoringSafeArea(.all)
            
            
            LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .center)
                .opacity(0.9)
                .edgesIgnoringSafeArea(.all)
            //                .blendMode(.multiply)
            ScrollView(showsIndicators: false) {
                
                VStack{
                HStack {
                    
                    Image(systemName: "location")
                    
                    Text(locationManger.locationName ?? "fetching location")
                        .foregroundColor(.black)
                    
                    
                    
                }
                .padding(.bottom, 56)
                
                    Text("The weather condition for the week is \(weatherManager.temp)")
                    .font(.title2)
                    .frame(width: 180, height: 210)
                VStack(spacing: 15) {
                    Spacer()
                    if let safeWeather = weather {
                        WeeklyCard(weeklyWeather: safeWeather.dailyForecast.forecast)
                    }
                        
                    
                }.padding(.bottom, 45)
                }.padding(.top, 12)
            }
           
        }.task(id: locationManger.currentLocation) {
            if let safeLocation = locationManger.currentLocation {
                do {
                    self.weather = try await weatherManager.getWeather(location: safeLocation)
                }catch {
                    print("Error in weather fetch \(error)")
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
