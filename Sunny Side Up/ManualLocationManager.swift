//
//  ManualLocationManager.swift
//  Sunny Side Up
//
//  Created by Mayur P on 29/07/23.
//

import Foundation
import MapKit

@MainActor class ManualLocationManager: ObservableObject {
    
    @Published var weekLati: Double {
           didSet {
               UserDefaults.standard.set(weekLati, forKey: "lati")
           }
       }
    @Published var weekLongi: Double {
           didSet {
               UserDefaults.standard.set(weekLongi, forKey: "longi")
           }
       }
    @Published var manualLocation : CLLocation?
    
    @Published var manualRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    init(manualLocation: CLLocation? = nil, manualRegion: MKCoordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)) {
        self.manualLocation = manualLocation
        self.manualRegion = manualRegion
        self.weekLati = UserDefaults.standard.object(forKey: "longi") as? Double ?? 0.9
        self.weekLongi = UserDefaults.standard.object(forKey: "longi") as? Double ?? 0.1
        setupManual()
       
    }
    
    
    func setupManual() {
        
         let lati = UserDefaults.standard.double(forKey: "lati")
         let longi = UserDefaults.standard.double(forKey: "longi")
        var safeCLL = (CLLocationCoordinate2D(latitude: lati, longitude: longi))
        
        var safeRegion = MKCoordinateRegion(center: safeCLL, span: MapDetails.defaultSpan)
        
        self.manualRegion = safeRegion
    }
}
