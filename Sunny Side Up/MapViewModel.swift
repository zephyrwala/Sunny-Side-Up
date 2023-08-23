//
//  MapViewModel.swift
//  Sunny Side Up
//
//  Created by Mayur P on 10/07/23.
//


import MapKit
import WeatherKit

enum MapDetails {
    
    //51.51656361076987, -0.12976224681730195
    static let startingLocation = CLLocationCoordinate2D(latitude: 51.51656361076987 , longitude: -0.12976224681730195)
    static let defaultSpan = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
}


@MainActor final class LocationManager: NSObject, ObservableObject {
    
    @Published var returnedPlace : Place?
    @Published var showManualLocation = false
    
    @Published var currentLocation : CLLocation?
    @Published var locationName : String?
    @Published var weather: Weather?
    @Published var region = MKCoordinateRegion(
        center: .init(latitude: 0.0, longitude: 0.0),
           span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5)
       )
    @Published var returnedRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    @Published var defaultRegion = MKCoordinateRegion(center: MapDetails.startingLocation, span: MapDetails.defaultSpan)
    
    private let locationManager = CLLocationManager()
    
    override init() {
           super.init()
           
        self.locationManager.delegate = self
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        self.region = MKCoordinateRegion(
//            center: .init(latitude: currentLocation?.coordinate.latitude ?? 37.334_900, longitude: currentLocation?.coordinate.longitude ?? -122.009_020),
//            span: .init(latitudeDelta: 0.5, longitudeDelta: 0.5)
//        )
        self.setup()
//           self.checkLocationSource()
       }
    
    func setup() {
        if showManualLocation == true {
            self.currentLocation = CLLocation(latitude: returnedPlace?.latitude ?? 0.0, longitude: returnedPlace?.longitude ?? 0.0)
           
         
            locationName = returnedPlace?.name
            
            DispatchQueue.main.async { [self] in
                
                let newArea = CLLocationCoordinate2D(latitude: returnedPlace?.latitude ?? 0.0, longitude: returnedPlace?.longitude ?? 0.0)
               
                self.returnedRegion = MKCoordinateRegion(center: newArea, span: MapDetails.defaultSpan)
//                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
//
               
            }
            
            
        } else {
            switch locationManager.authorizationStatus {
            //If we are authorized then we request location just once, to center the map
            case .authorizedWhenInUse:
                locationManager.requestLocation()
            //If we don´t, we request authorization
            case .notDetermined:
                locationManager.startUpdatingLocation()
                locationManager.requestWhenInUseAuthorization()
                           
                //NOTE: - this has been modified
            case .authorizedAlways:
//                DispatchQueue.main.async { [self] in
                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
            
               
    
//                }
                
            default:
                break
            }
        }
       
       }
//    func checkIfLocationServiceIsEnabled() {
//
//        func locationServicesEnabled() async -> Bool {
//            if CLLocationManager.locationServicesEnabled() {
//                //check phone's location is on
////                locationManager = CLLocationManager()
////                locationManager?.delegate = self
//                //check location permisioon
//    //            checkLocationAuth()
//                return true
//            } else {
//                print("Show an alert with location off and get it on")
//                return false
//            }
//        }
//
//
//    }
    
   
    
    
    func checkLocationAuth() {
        
      
        
//
//        switch locationManager.authorizationStatus {
//
//        case .notDetermined:
//            locationManager.requestWhenInUseAuthorization()
//        case .restricted:
//            print("your location is restricted")
//        case .denied:
//            print("you have denied location access")
//        case .authorizedAlways, .authorizedWhenInUse:
//            DispatchQueue.main.async { [self] in
//                region = MKCoordinateRegion(center: locationManager.location!.coordinate, span: MapDetails.defaultSpan)
//
//
//            }
//
//        @unknown default:
//            break
//        }
    }
    

    
}



extension LocationManager: CLLocationManagerDelegate {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last
        else {return}
        locationManager.stopUpdatingLocation()
        let geoCoder = CLGeocoder()
        geoCoder.reverseGeocodeLocation(location, completionHandler: { placemarks, error -> Void in
            
            // Place details
            guard let placeMark = placemarks?.first else { return }
            
            
            if let safeLocation = placeMark.subLocality {
                
                if let safeCityName = placeMark.locality {
                    
                    DispatchQueue.main.async {
                        print("Location name - \(safeLocation)")
                        self.locationName = "\(safeCityName) | \(safeLocation)"
                        
                        
                    }
                    
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
    
    func checkLocationSource() {
        if showManualLocation == false {
           
           
            self.setup()
     
            
        } else  {
            
   
            
            
        }
    }
    

}


extension LocationManager {
    func locationManagerDidChangeAuthorization(_ manager: CLLocationManager) {
        guard .authorizedWhenInUse == manager.authorizationStatus else { return }
        locationManager.requestLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Something went wrong: \(error)")
    }
    
//    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
//        locationManager.stopUpdatingLocation()
//        locations.last.map {
//            region = MKCoordinateRegion(
//                center: $0.coordinate,
//                span: .init(latitudeDelta: 0.01, longitudeDelta: 0.01)
//            )
//
//
//        }
//    }
}
