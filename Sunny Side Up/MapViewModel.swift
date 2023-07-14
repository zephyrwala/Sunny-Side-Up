//
//  MapViewModel.swift
//  Sunny Side Up
//
//  Created by Mayur P on 10/07/23.
//


import MapKit

enum MapDetails {
    
    static let startingLocation = CLLocationCoordinate2D(latitude: 0.0 , longitude: 0.0)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}


@MainActor final class LocationManager: NSObject, ObservableObject {
    
    @Published var currentLocation : CLLocation?
    @Published var locationName : String?
    @Published var region = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    private let locationManager = CLLocationManager()
    
    override init() {
        super.init()
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.distanceFilter = kCLDistanceFilterNone
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.startUpdatingLocation()
    }
    
    func checkIfLocationServiceIsEnabled() {
        
        func locationServicesEnabled() async -> Bool {
            if CLLocationManager.locationServicesEnabled() {
                //check phone's location is on
//                locationManager = CLLocationManager()
//                locationManager?.delegate = self
                //check location permisioon
    //            checkLocationAuth()
                return true
            } else {
                print("Show an alert with location off and get it on")
                return false
            }
        }
        
       
    }
    
    
    func checkLocationAuth() {
        
      
        
        
        switch locationManager.authorizationStatus {
            
        case .notDetermined:
            locationManager.requestWhenInUseAuthorization()
        case .restricted:
            print("your location is restricted")
        case .denied:
            print("you have denied location access")
        case .authorizedAlways, .authorizedWhenInUse:
            DispatchQueue.main.async { [self] in
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            }
           
        @unknown default:
            break
        }
    }
    

    
}



extension LocationManager: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last, currentLocation == nil
        else {return}
        
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error -> Void in
            
            // Place details
            guard let placeMark = placemarks?.first else { return }
            
            if let safeLocation = placeMark.subAdministrativeArea {
                DispatchQueue.main.async {
                    print("Location name - \(safeLocation)")
                    self.locationName = safeLocation
                }
               
//                DispatchQueue.main.async {
//                    self.locationName = safeLocation
//                }
                
            }
        
            
            
        })
        
        DispatchQueue.main.async {
            self.currentLocation = location
        }
    }
}


extension LocationManager {
    func getCityName() {
    
    }
    
}
