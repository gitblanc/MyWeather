//
//  LocationManager.swift
//  Weather App
//
//  Created by Eduardo Blanco Bielsa on 8/5/23.
//

import Foundation
//framework to get the user's current location
import CoreLocation
//Confirm the next protocols: NSObject, ObservableObject and CLLocationManagerDelegate
class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate{
    //manager
    let manager = CLLocationManager();
    
    @Published var location: CLLocationCoordinate2D?//we put ? because maybe the user doesn't allow location so it's optional
    @Published var isLoading = false
    
    override init() {
        super.init()
        manager.delegate = self
    }
    
    func requestLocation(){
        isLoading = true
        manager.requestLocation()
    }
    
    //---functions to make CLLocationManager work---//
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        location = locations.first?.coordinate//the location may be null
        isLoading = false
    }
    
    //function to handle errors
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("Error getting location", error)
        isLoading = false
    }
}
