//
//  ManualLocationManager.swift
//  Sunny Side Up
//
//  Created by Mayur P on 29/07/23.
//

import Foundation
import MapKit

@MainActor class ManualLocationManager: ObservableObject {
    
    
    @Published var manualLocation : CLLocation?
    @Published var manualRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    init(manualLocation: CLLocation? = nil, manualRegion: MKCoordinateRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)) {
        self.manualLocation = manualLocation
        self.manualRegion = manualRegion
    }
    
}
