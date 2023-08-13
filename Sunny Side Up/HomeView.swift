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
    
//    @StateObject private var locationManager = LocationManager()
//    @EnvironmentObject var locationManager: LocationManager
    @State private var weather: Weather?
    @State private var returnedPlace = MKCoordinateRegion()
    @State var thisPlaceReturned = Place(mapItem: MKMapItem())

    @State var testRegion = MKCoordinateRegion(
            center: .init(latitude: 37.334_900,longitude: -122.009_020),
            span: .init(latitudeDelta: 0.2, longitudeDelta: 0.2)
        )
    @State var manualLocationShow = false
    @State private var cityName = "Loading"
    @EnvironmentObject var environmentLocationManager: LocationManager
    @State private var weatherColor = Color.yellow
    @State private var showReturnedPlace = false
    @State private var favoriteColor = 0
    @State private var showButton = false
    @State private var showingSheet = false
    @State private var offset = CGFloat.zero
    let weatherService = WeatherService.shared
    @State private var searchText = ""
    let impactFeedback = UIImpactFeedbackGenerator(style: .medium)
    private var twoColumnGrid = [GridItem(.flexible()), GridItem(.flexible())]
    var body: some View {
        
        NavigationStack {
            ZStack {
             
//                    var newStartingLocation = CLLocation(latitude: returnedPlace.latitude, longitude: returnedPlace.longitude)
//                    var newSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
//
                
                if environmentLocationManager.showManualLocation == false {
                    
                    Map(coordinateRegion: $environmentLocationManager.region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                            .accentColor(Color.black)
                            .edgesIgnoringSafeArea(.all)
                    
                }else {
                    
                    Map(coordinateRegion: $environmentLocationManager.returnedRegion, showsUserLocation: false, userTrackingMode: .constant(.none))
                            .accentColor(Color.black)
                            .edgesIgnoringSafeArea(.all)
                    
                }
           
                
                    
                
               
                LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8), .black]), startPoint: .top, endPoint: .center)
                   .blendMode(.multiply)
//                   .background(.ultraThickMaterial)
                    .opacity(0.8)
                    .edgesIgnoringSafeArea(.all)
                
             
                  
//                LinearGradient(gradient: Gradient(colors: [.clear, .black]), startPoint: .top, endPoint: .center)
//                    .opacity(0.1)
//                    .edgesIgnoringSafeArea(.all)
////
//                LinearGradient(gradient: Gradient(colors: [weatherColor, .clear]), startPoint: .bottomTrailing, endPoint: .center)
//                    .opacity(0.9)
//                    .edgesIgnoringSafeArea(.all)
                   
               
                    ScrollView(.vertical, showsIndicators: false) {
                        
                        ZStack{
                            
                            
                            LinearGradient(gradient: Gradient(colors: [.green.opacity(0.0), .black.opacity(0.6)]), startPoint: .topLeading, endPoint: .center)
                                .blendMode(.hardLight)
//                                .background(.ultraThinMaterial)
                                 .opacity(0.3)
                                 .edgesIgnoringSafeArea(.all)
                             
                            
                          
                            VStack(alignment: .leading) {
                                
//                                MainWeatherCard(currentWeather: weather, weatherColorIs: weatherColor)
                                
                                WeatherCard2(currentWeather: weather, weatherColorIs: weatherColor)
                                
                               
                                Spacer()
                                
                                
                                VStack {
                                    
//                                    HStack {
//                                        Text("Rain in the next few hours")
//                                            .foregroundColor(.gray.opacity(0.6))
//                                            .padding(.leading, 10)
//                                        Spacer()
//                                    }
                                    if let weather {
                                        let safear =  Array(weather.hourlyForecast.filter({ hourlyWeather in
                                            return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                                        }).prefix(24))
                                        
                                        
                                        
                                        PrecipitationHour(hourPrecipitation: safear, weatherColorIs: weatherColor)
//                                            .padding()
                                            .padding(.top, 21)
                                    }
                                    
//                                    Picker("What is your favorite color?", selection: $favoriteColor) {
//                                                    Text("Red").tag(0)
//                                                    Text("Green").tag(1)
//                                                    Text("Blue").tag(2)
//                                                }
//                                    .pickerStyle(.segmented)
//                                    .opacity(0.6)
                                
                                //MARK: - Hourly chart
                                
                                
                                
                                VStack(alignment: .leading) {
                                    
                                    
                                    ScrollView(.horizontal) {
                                        HStack(spacing: 12) {
                                            if let weather {
                                                let safear =  Array(weather.hourlyForecast.filter({ hourlyWeather in
                                                    return hourlyWeather.date.timeIntervalSince(Date()) >= 0
                                                }).prefix(25))
                                                
                                                HourlyCard(hourlyWeather: safear, weatherColorIs: weatherColor)
                                                
                                                
                                            }
                                        }
                                        
                                    }.scrollIndicators(.hidden)
                                    
                                }.padding(.top, 51)
//                                    .padding()
                               
                                //hourly chart^
                          
                                }.padding()
                                
                                //                       Spacer()
                                VStack(alignment: .center) {
                                    
                                    HStack{
                                        Text("Today")
                                            .foregroundColor(.gray.opacity(0.6))
                                            .padding(.leading, 15)
                                        Spacer()
                                    }
                                    
                                    VStack (alignment: .center, spacing: 15){
                                        //1
                                        HStack(spacing: 15) {
                                            if let safeWeather = weather?.dailyForecast {
                                                if let sunrise = safeWeather[0].sun.sunrise {
                                                    ConditionsCard(currentWeatherCondition: "Sunrise", weatherconditionValue: "\(sunrise.formatted(date: .omitted, time: .shortened))", weatherColorIs: weatherColor, icons: "sunrise.fill")
                                                }
                                            }
                                            
                                            
                                            if let safeWeather = weather?.dailyForecast {
                                                if let sunrise = safeWeather[0].sun.sunset {
                                                    ConditionsCard(currentWeatherCondition: "Sunset", weatherconditionValue: "\(sunrise.formatted(date: .omitted, time: .shortened))", weatherColorIs: weatherColor, icons: "sunset.fill")
                                                }
                                            }
                                        }
                                        
                                        //2
                                        HStack(spacing: 15) {
                                            
                                            if let safeWeather = weather?.dailyForecast {
                                                
                                                ConditionsCard(currentWeatherCondition: "Rain", weatherconditionValue: "\(safeWeather[0].precipitationChance.formatted(.percent))", weatherColorIs: weatherColor, icons: "drop.degreesign.fill")
                                                
                                            }
                                            
                                            if let safeWeather = weather?.currentWeather {
                                                
                                                ConditionsCard(currentWeatherCondition: "Humidity", weatherconditionValue: "\(safeWeather.humidity.formatted(.percent))", weatherColorIs: weatherColor, icons: "humidity.fill")
                                                
                                            }
                                        }
                                    }
                                }
                                .padding()
                                
                                
                                
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
                                    
                                    
                                    
                                    HumidityHour(hourPrecipitation: safear, weatherColorIs: weatherColor)
                                        .padding()
                                        .padding(.top, 21)
                                        .padding(.bottom, 21)
                                }
                                
                                //weekly
                                VStack (alignment: .center){
                                    MoonCard(weatherColorIs: weatherColor)
                                }
                                .padding()
                                Spacer()
                                
                                
                                
                            }.padding(.top, 60)
                                .padding(.bottom, 100)
                            
                        }
                        
                    }
                
                
                
                }.edgesIgnoringSafeArea(.all)
                .background(.black)
                
                .task(id: environmentLocationManager.currentLocation) {

                    
    //                 viewModel.checkIfLocationServiceIsEnabled()
                  
                
                      
                        do {
                            
                            //TODO: - un comment this for actual location
                            if let location = environmentLocationManager.currentLocation {
                               
                              //static location 12.97573174471989, 77.60148697323523
                              
                                self.weather = try await weatherService.weather(for: location)
                              
                                if let safeCondition = weather?.currentWeather.condition.description {
                                    
                                    switch safeCondition {
                                    case "Rain":
                                        self.weatherColor = Color.yellow
                                        
                                    default:
                                        self.weatherColor = Color.yellow
                                    }
                                    
                                }
                                print("weather is \(weather)")
        
                         }
                            
                            
                        } catch {
                            print("Error in fetching weather maniual")
                        }
                        
                    
                 
                   
                    
                    
            }
                .onAppear{
                   
//                    environmentLocationManager.checkLocationSource()
//                    environmentLocation.checkIfLocationServiceIsEnabled()
    //                viewModel.checkLocationAuth()
                    
                    
            }
            
                .navigationBarTitleDisplayMode(.inline)
                .toolbarColorScheme(.dark, for: .navigationBar)
                .toolbar { // <2>
                    
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        
                        Button {
                            
                            showReturnedPlace.toggle()
                            print("show toggel \(showReturnedPlace)")
                            showingSheet.toggle()
                           

                        } label: {
                            
//                            Image(systemName: "plus.magnifyingglass")
                            
                            NavigationLink {
                                SearchPlacesView(returnedPlace: $thisPlaceReturned, showManualLocation: $environmentLocationManager.showManualLocation, returnedRegion: $returnedPlace)
                                    .toolbar(.hidden, for: .bottomBar)
                            } label: {
                                VStack{
                                    Image(systemName: "plus.magnifyingglass")

//                                        .foregroundColor(.white)
                                        .symbolRenderingMode(.palette)
                                        .foregroundStyle(Color.white, Color.black)
                                }
                            }

//                            NavigationLink("+", destination: SearchPlacesView(returnedPlace: $thisPlaceReturned, showManualLocation: $manualLocationShow, returnedRegion: $returnedPlace))
                        }

              
                    })
                    
                    ToolbarItem(placement: .navigationBarLeading) { // <3>
                        
                        
                        VStack {
                            
                            Button {
                                showReturnedPlace.toggle()
                                print("show toggel \(showReturnedPlace)")
                                showingSheet.toggle()
                                
                            } label: {
                                HStack {
                                    
                                    Image(systemName: "location.circle.fill")
                                        .foregroundColor(weatherColor)
//                                        .shadow(color: .black.opacity(0.3), radius: 9)
                                    if environmentLocationManager.showManualLocation == true {
                                        Text(thisPlaceReturned.name ?? "loading")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
//                                            .shadow(color: weatherColor, radius: 3)
                                    } else {

                                        Text(environmentLocationManager.locationName ?? "loading")
                                            .foregroundColor(.white)
                                            .font(.subheadline)
//                                            .shadow(color: weatherColor, radius: 9)
                                    }
                                    
                                    
//                                    Text(environmentLocation.locationName ?? "loading")
//                                        .foregroundColor(.white)
//                                        .font(.subheadline)
//
                                }
                            }
//                            .sheet(isPresented: $showingSheet) {
//                                SearchPlacesView(returnedPlace: $thisPlaceReturned, showManualLocation: $manualLocationShow, returnedRegion: $returnedPlace)
//                            .presentationDetents([.medium, .large])
//
                                                            }

                          
//                            Text("current")
//                                .font(.system(size: 9))
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

