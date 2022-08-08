//
//  MotionViewModel.swift
//  MotionDemo
//
//  Created by Colin Smith on 8/2/22.
//

import Foundation
import CoreMotion

class MotionViewModel: ObservableObject {
    
    @Published var accelerationX: Double = 0.0
    @Published var accelerationY: Double = 0.0
    @Published var accelerationZ: Double = 0.0
    @Published var totalVector: Double = 0.0
    
    
    @Published var maxAccelerationX: Double = 0.0
    @Published var maxAccelerationY: Double = 0.0
    @Published var maxAccelerationZ: Double = 0.0
    @Published var maxTotalVector: Double = 0.0
    
    @Published var turningVector: Double = 0.0
    @Published var maxTurningVector: Double = 0.0
    let manager = CMMotionManager()

    @Published var latLong = ""
    
    
    func startUpdate() {
        manager.startDeviceMotionUpdates()
        Timer.scheduledTimer(withTimeInterval: 0.25
                             , repeats: true) { _ in
            if let data = self.manager.deviceMotion {
                self.accelerationX = data.userAcceleration.x
                self.accelerationY = data.userAcceleration.y
                self.accelerationZ = data.userAcceleration.z
                
                self.totalVector = sqrt((data.userAcceleration.x.magnitudeSquared) + (data.userAcceleration.y.magnitudeSquared) + (data.userAcceleration.z.magnitudeSquared))
                if self.maxTotalVector < self.totalVector {
                    self.maxTotalVector = self.totalVector
                }
                if data.userAcceleration.x > self.maxAccelerationX {
                    self.maxAccelerationX = abs(data.userAcceleration.x)
                }
                if data.userAcceleration.y > self.maxAccelerationY {
                    self.maxAccelerationY = abs(data.userAcceleration.y)
                }
                if data.userAcceleration.z > self.maxAccelerationZ {
                    self.maxAccelerationZ = abs(data.userAcceleration.z)
                    
                }
                
                
                self.turningVector = sqrt(data.userAcceleration.x.magnitudeSquared + data.userAcceleration.z.magnitudeSquared)
                
                if self.turningVector > self.maxTurningVector {
                    self.maxTurningVector = self.turningVector
                }
            }
            
        }
    }
    
    func resetData() {
        maxAccelerationX = 0.0
        maxAccelerationY = 0.0
        maxAccelerationZ = 0.0
        
        maxTotalVector = 0.0
        maxTurningVector = 0.0
    }
    
}
