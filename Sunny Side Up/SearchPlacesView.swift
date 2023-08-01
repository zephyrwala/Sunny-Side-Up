//
//  SearchPlacesView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 26/07/23.
//

import SwiftUI
import MapKit
import Combine
import WeatherKit


struct SearchPlacesView: View {
//    @EnvironmentObject var locationManager : LocationManager
    let searchTextPublisher = PassthroughSubject<String, Never>()
    @StateObject private var locationManager = LocationManager()
    @StateObject var placeVM = PlaceViewModel()
    @State private var weather: Weather?
    let weatherService = WeatherService.shared
    @Binding var returnedPlace : Place
    @Binding var showManualLocation: Bool
    @Binding var returnedRegion : MKCoordinateRegion
    
    //binding step one done
    
    @State private var searchText = ""
    @Environment(\.dismiss) private var dismiss
//    var places = ["Kurla", "Dadar", "Byculla", "Nashik"]
    var body: some View {
        NavigationStack{
            List(placeVM.places) { place in
                
                ZStack {
                  
                    Color.gray
                        .background(.ultraThickMaterial)
                        .opacity(0.1)
                        .frame(height: 75)
                        .cornerRadius(10)
//
//
//                    Map(coordinateRegion: $placeVM.myRegion)
//                        .frame(height: 90)
//                        .cornerRadius(15)
//
//                    LinearGradient(gradient: Gradient(colors: [.black.opacity(0.8), .black.opacity(0.9)]), startPoint: .top, endPoint: .center)
////                        .blendMode(.multiply)
//                        .opacity(0.9)
//                        .frame(height: 90)
//                        .cornerRadius(15)
                    
                 

                    HStack(alignment: .top){
                        
                    
                        
                        VStack(alignment: .leading, spacing: 6) {
                            
                            Spacer()
                            
                            HStack {
                                
//                                Image(systemName: "mappin.circle")
//                                    .foregroundColor(.yellow)
                                
                                Text(place.name)
                                    .font(.system(size: 16, weight: .regular))
                                    .shadow(radius: 10)
                                    .foregroundColor(.yellow.opacity(0.9))
                                Spacer()
                            }
                            HStack {
                                Text(place.address)
                                    .font(.system(size: 12, weight: .light))
                                    .shadow(radius: 10)
                                    .foregroundColor(.gray)
                                Spacer()
                            }
                            
                            
                            
                        }.onTapGesture {
                            
                            returnedPlace = place
                            returnedRegion = place.myRegion
                            showManualLocation.toggle()
                            dismiss()
                            print("This is selected \(place.name) and latitude is \(place.latitude) and longitude is \(place.longitude) and region is \(place.myRegion)")
                        }
                        .padding()
                        .frame(height: 70)
                        
                        
                        VStack(spacing: 6) {
                            Image(systemName: weather?.currentWeather.symbolName ?? "ellipsis")
                            
                            Text(weather?.currentWeather.temperature.formatted() ?? "--")
                                .foregroundColor(.gray)
                        }
                        .padding()
                      
                    }
                    .frame(height: 75)
                    
                
                .task {
                    do {
                        
                        let safeLoca = CLLocation(latitude: place.latitude, longitude: place.longitude)
                        self.weather = try await weatherService.weather(for: safeLoca)
                        
                        
                    } catch {
                        print("Error in fetching weather maniual")
                    }
                    
                }
                }
                .listRowSeparator(.hidden)
            }
           
            .listStyle(.plain)
          
                .searchable(text: $searchText)
                .navigationTitle("Search")
                .navigationBarTitleDisplayMode(.inline)
                .preferredColorScheme(.dark)
                .onAppear{
                    
                    showManualLocation = false
                }
            
             
                .onChange(of: searchText) { searchText in
                    
                           searchTextPublisher.send(searchText)
                       }
                       .onReceive(
                           searchTextPublisher
                               .debounce(for: .milliseconds(500), scheduler: DispatchQueue.main)
                       ) { debouncedSearchText in
                           if !debouncedSearchText.isEmpty {
                               placeVM.search(text: debouncedSearchText, region: locationManager.region)
                               print("LOGA \($placeVM.myRegion)")
                           } else {
                               placeVM.places = []
                           }
                          
                       }
            
//                .onChange(of: searchText, perform: { text in
//                    if !text.isEmpty && text.count > 3 {
//                        placeVM.search(text: text, region: locationManager.region)
//                    }else {
//                        placeVM.places = []
//                    }
//                })
                       .toolbar(.hidden, for: .bottomBar)
                .toolbar {
                    
                    ToolbarItem(placement: .navigationBarTrailing, content: {
                        Button("Dismiss") {
                            print("Dismissed")
                        }
                    })
                }
        }.preferredColorScheme(.dark)
            .accentColor(.gray)

           
    }
}

struct SearchPlacesView_Previews: PreviewProvider {
    static var previews: some View {
        SearchPlacesView(returnedPlace: .constant(Place(mapItem: MKMapItem())), showManualLocation: .constant(true), returnedRegion: .constant(MKCoordinateRegion()))
            .environmentObject(LocationManager())
    }
}
