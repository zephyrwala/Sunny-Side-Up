//
//  PlaceViewModel.swift
//  Sunny Side Up
//
//  Created by Mayur P on 27/07/23.
//

import Foundation
import MapKit


@MainActor
class PlaceViewModel: ObservableObject {
    
    @Published var places: [Place] = []
    @Published var myRegion = MKCoordinateRegion()
    
    func search(text: String, region: MKCoordinateRegion) {
        
        let searchRequest = MKLocalSearch.Request()
        
        searchRequest.naturalLanguageQuery = text
        
        searchRequest.region = region
        
        print("rohol \(searchRequest.region)")
        let search = MKLocalSearch(request: searchRequest)
        
        search.start { response, err in
            
            
            guard let safeResponse = response else {
                print("😛 error \(err?.localizedDescription ?? "unknown error")")
                return
            }
            
            self.myRegion = safeResponse.boundingRegion
            self.places = safeResponse.mapItems.map(Place.init)
            print("Cordi - \(searchRequest.region)")
        }
        
    }
    
    
}
