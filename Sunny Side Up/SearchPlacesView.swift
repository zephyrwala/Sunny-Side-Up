//
//  SearchPlacesView.swift
//  Sunny Side Up
//
//  Created by Mayur P on 26/07/23.
//

import SwiftUI
import MapKit
import Combine


struct SearchPlacesView: View {
//    @EnvironmentObject var locationManager : LocationManager
    let searchTextPublisher = PassthroughSubject<String, Never>()
    @StateObject private var locationManager = LocationManager()
    @StateObject var placeVM = PlaceViewModel()
  
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
                
                VStack(alignment: .leading) {
                    Text(place.name)
                        .font(.subheadline)
                        .foregroundColor(.yellow)
                    
                    Text(place.address)
                        .font(.callout)
                        .foregroundColor(.gray)
                    
                }.onTapGesture {
                    
                    returnedPlace = place
                    returnedRegion = place.myRegion
                    showManualLocation.toggle()
                    dismiss()
                    print("This is selected \(place.name) and latitude is \(place.latitude) and longitude is \(place.longitude) and region is \(place.myRegion)")
                }
                
            }.listStyle(.plain)
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
