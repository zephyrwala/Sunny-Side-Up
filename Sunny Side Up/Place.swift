//
//  Place.swift
//  Sunny Side Up
//
//  Created by Mayur P on 27/07/23.
//

import Foundation
import MapKit


struct Place: Identifiable {
    
    
    let id = UUID().uuidString
    
    //only one stored property
    private var mapItem : MKMapItem
    
    
    //code to setup a new place based on the values we pass here
    init(mapItem: MKMapItem) {
        
        self.mapItem = mapItem
        
    }
    
    
    
    
    var name: String {
        self.mapItem.placemark.name ?? ""
    }
    
    
    
    
    
    var address: String {
        
        let placemark = self.mapItem.placemark
        var cityAndState = ""
        var address = ""
        
        cityAndState = placemark.locality ?? ""
        if let state = placemark.administrativeArea {
            cityAndState = cityAndState.isEmpty ? state : "\(cityAndState), \(state) "
        }
        
        address = placemark.subThoroughfare ?? "" //address number
        
        if let street = placemark.thoroughfare {
            //just to show the street
            
            address = address.isEmpty ? street : "\(address) \(street)"
        }
        
        if address.trimmingCharacters(in: .whitespaces).isEmpty && !cityAndState.isEmpty {
            address = cityAndState
        } else {
            
            address = cityAndState.isEmpty ? address : "\(address), \(cityAndState)"
        }
        
        return address
    }
    
    
    
    
    
    
    var latitude: CLLocationDegrees {
        
        self.mapItem.placemark.coordinate.latitude
        
    }
    
    
    
    
    
    var longitude: CLLocationDegrees {
        
        self.mapItem.placemark.coordinate.longitude
        
    }
 
    
    
     var myRegion: MKCoordinateRegion {
         
         
        
        var safeRegion = MKCoordinateRegion()
        let startingLocation = CLLocationCoordinate2D(latitude: self.mapItem.placemark.coordinate.latitude , longitude: self.mapItem.placemark.coordinate.longitude
)
        let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        safeRegion = MKCoordinateRegion(center: startingLocation, span: MapDetails.defaultSpan)
        
        
        return safeRegion
    }
    
}
