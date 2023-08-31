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
    
    
    @AppStorage ("latits") private var latits = 0.0
    @AppStorage ("longis") private var longis = 0.0
    @State private var weather: Weather?
//    @State private var latits = UserDefaults.standard.double(forKey: "lati")
//    @State private var longits = UserDefaults.standard.double(forKey: "longi")
   
    @State private var weatherColor = Color.yellow
   @StateObject private var userdef = ManualLocationManager()
    let weatherService = WeatherService.shared
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 21.4, longitude: 77.5), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
 
//    @StateObject private var locationManger = LocationManager()
    @EnvironmentObject var environmentLocationManager: LocationManager
    @StateObject private var weatherManager = LocalWeatherManager()
    
    var body: some View {
        NavigationStack {
            ZStack {
//                if environmentLocationManager.showManualLocation == false {
//
//                    Map(coordinateRegion: $environmentLocationManager.region, showsUserLocation: false, userTrackingMode: .constant(.none))
//                            .accentColor(Color.black)
//                            .edgesIgnoringSafeArea(.all)
                    
//                }else {
                
                   
                Map(coordinateRegion: $region)
                            .accentColor(Color.pink)
                            .edgesIgnoringSafeArea(.all)
                    
//                }
              
//                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8), .black]), startPoint: .top, endPoint: .center)
////                                .blendMode(.multiply)
//                    .opacity(0.8)
//                    .edgesIgnoringSafeArea(.all)
                //                .blendMode(.multiply)
                ScrollView(showsIndicators: false) {
                    ZStack{
                        LinearGradient(gradient: Gradient(colors: [.mint.opacity(0.9), .purple.opacity(0.99), .black.opacity(0.99), .black.opacity(0.99)]), startPoint: .top, endPoint: .center)
        //                    .blendMode(.darken)

                            .opacity(0.85)
                            .edgesIgnoringSafeArea(.all)
                    
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
                        if let saferWeather = environmentLocationManager.weather {
                            WeeklyChart(weeklyWeather: saferWeather.dailyForecast.forecast)
                            //                             .frame(height: 300)
                                .foregroundColor(.black)
                                .padding(.top, 20)
                        }
                        
                        VStack(spacing: 15) {
                            Spacer()
                            if let safeWeather = environmentLocationManager.weather {
                                WeeklyCard(weeklyWeather: safeWeather.dailyForecast.forecast)
                            }
                            
                            
                        }.padding(.bottom, 45)
                    }.padding(.top, 60)
                            .padding(.bottom, 100)
                }
                }.edgesIgnoringSafeArea(.all)
               
            }
            
            .onAppear() {
              
                DispatchQueue.main.async {
                    var safeCo = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: latits, longitude: longis), span: MapDetails.defaultSpan)
                    
                    self.region = safeCo
    //                safeCo = self.region
    //                userdef.setupManual()
                    print("weekview user def is \(self.latits) and \(self.longis)")
                }
                
                
            }
//            .task(id: environmentLocationManager.currentLocation) {

                
//                 viewModel.checkIfLocationServiceIsEnabled()
              
                //comment from here
//
//                if environmentLocationManager.showManualLocation == true {
//                    do {
//
//                        //TODO: - un comment this for actual location
//                        environmentLocationManager.currentLocation = CLLocation(latitude: environmentLocationManager.returnedPlace?.latitude ?? 0.0, longitude: environmentLocationManager.returnedPlace?.longitude ?? 0.0)
//                        if let location = environmentLocationManager.currentLocation {
//
//                          //static location 12.97573174471989, 77.60148697323523
//
//                            self.weather = try await weatherService.weather(for: location)
//
//                            if let safeCondition = weather?.currentWeather.condition.description {
//
//                                switch safeCondition {
//                                case "Rain":
//                                    self.weatherColor = Color.yellow
//
//                                default:
//                                    self.weatherColor = Color.yellow
//                                }
//
//                            }
////                            print("weather is \(weather)")
//
//                     }
//
//
//                    } catch {
//                        print("Error in fetching weather maniual")
//                    }
//
//                } else {
//                    do {
//
//                        //TODO: - un comment this for actual location
//                        if let location = environmentLocationManager.currentLocation {
//
//                          //static location 12.97573174471989, 77.60148697323523
//
//                            self.weather = try await weatherService.weather(for: location)
//
//                            if let safeCondition = weather?.currentWeather.condition.description {
//
//                                switch safeCondition {
//                                case "Rain":
//                                    self.weatherColor = Color.yellow
//
//                                default:
//                                    self.weatherColor = Color.yellow
//                                }
//
//                            }
////                            print("weather is \(weather)")
//
//                     }
//
//
//                    } catch {
//                        print("Error in fetching weather maniual")
//                    }
//                }
                  
                //uncommenmt till here
                    
                
             
               
                
//
//        }
            
//            .task(id: environmentLocation.currentLocation) {
//
//                  if environmentLocation.showManualLocation == true {
//
//                      do {
//
//                          let safeLoca = CLLocation(latitude: environmentLocation.returnedPlace?.latitude ?? 0.0, longitude: environmentLocation.returnedPlace?.longitude ?? 0.0)
//                          self.weather = try await weatherService.weather(for: safeLoca)
//
//
//                      } catch {
//                          print("Error in fetching weather maniual")
//                      }
//
//                  } else {
//                      do {
//                          //TODO: - un comment this for actual location
//                          if let location = environmentLocation.currentLocation {
//
//                            //static location 12.97573174471989, 77.60148697323523
//
//                              self.weather = try await weatherService.weather(for: location)
//
//                              if let safeCondition = weather?.currentWeather.condition.description {
//
//                                  switch safeCondition {
//                                  case "Rain":
//                                      self.weatherColor = Color.yellow
//
//                                  default:
//                                      self.weatherColor = Color.yellow
//                                  }
//
//                              }
//                              print("weather is \(weather)")
//
//                       }
//                      }catch {
//                          print(error)
//                      }
//                  }
//
//
//        }
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbar { // <2>
                    ToolbarItem(placement: .principal) { // <3>
                        VStack {
                            HStack {
                                
                                Image(systemName: "location.circle.fill")
                                    .foregroundColor(.yellow)
                                if environmentLocationManager.showManualLocation == true {
                                    
                                    Text(environmentLocationManager.returnedPlace?.name ?? "loading")
                                        .foregroundColor(.white)
                                    
                                } else {
                                    Text(environmentLocationManager.locationName ?? "loading")
                                        .foregroundColor(.white)
                                }
                                
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



