//
//  ContentView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 08/07/23.
//

import SwiftUI
import MapKit

struct ContentView: View {
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    @State private var searchText = ""
    
    var body: some View {
        
        
        NavigationStack {
            ScrollView(.vertical) {
                ZStack {
                    Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                        .edgesIgnoringSafeArea(.all)
                    
                    
                    LinearGradient(gradient: Gradient(colors: [.yellow, .black]), startPoint: .top, endPoint: .center)
                        .opacity(0.9)
                        .edgesIgnoringSafeArea(.all)
        //                .blendMode(.multiply)
                    
                    
                    VStack {
                        HStack {
                            
        //                    Image(systemName: "location")
                            
//                            Text("Bengaluru")
//                                .foregroundColor(.black)
                           
                            
                            
                        }
                        .padding(.bottom, 66)
                        
                    
                       
                        HStack {
                            Image(systemName: "cloud.sun.rain")
                                .font(.system(size: 30))
                            Text("Rainy")
                                .font(.system(size: 30))
                        }
                        Text("21°C")
                            .foregroundColor(.black)
                            .font(.system(size: 90))
                        .foregroundColor(.white)
                        
                        HStack(spacing: 18) {
                            Image(systemName: "arrow.up")
                            Text("28°C")
                                .font(.system(size: 21))
                            
                            Image(systemName: "arrow.down")
                            Text("18°C")
                                .font(.system(size: 21))
                        }
                       
                        VStack(alignment: .leading) {
                           
                            ScrollView(.horizontal) {
                                HStack(spacing: 12) {
                                    ForEach(0 ..< 9) { item in
                                        HourlyCard()
                                            
                                            
                                    }
                                }
                            }
                        }.padding(.top, 66)
                            .padding()
                        
                       //hourly chart^
                        
                        VStack {
                            ForEach(0 ..< 9) { item in
                                WeeklyCard()
                            }
                        }
                        Spacer()
                    }
                   
                }
            }.edgesIgnoringSafeArea(.bottom)
                .navigationTitle("Bengaluru")
               
                .navigationBarTitleDisplayMode(.inline)
                .background(.yellow.opacity(0.9))
                .toolbarBackground(Color.yellow, for: .navigationBar)
                .toolbar {
                    Button {
                        print("Edit button was tapped")
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                            
                    }
                }
            
               
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
