//
//  VelocityViewModel.swift
//  MotionDemo
//
//  Created by Colin Smith on 8/5/22.
//

import Foundation

import LocationService

class VelocityViewModel: ObservableObject {
    
    
    @Published var velocity: Double = 0.0
    @Published var maxVelocity: Double = 0.0
    
    let locationClient = LocationClient()
    var latLong: String = ""
    
    func getLocation() {
        locationClient.checkLocationServicesEnabled()
        locationClient.checkLocationAuthorization()
        if let latlong = locationClient.getLocation() {
            self.latLong = latlong
        }
    }
    func updateVelocity() {
        velocity = locationClient.velocity
        if velocity > maxVelocity {
            maxVelocity = locationClient.velocity
        }
    }
    
    func resetVelocity() {
        maxVelocity = 0.0
    }
    
    
}
