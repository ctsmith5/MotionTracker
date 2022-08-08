//
//  MotionDemoApp.swift
//  MotionDemo
//
//  Created by Colin Smith on 8/2/22.
//

import SwiftUI

@main
struct MotionDemoApp: App {
    
    @State var viewSelection = 0
    var body: some Scene {
        WindowGroup {
            VStack {
                Picker(selection: $viewSelection) {
                    Text("Velocity").tag(0)
                    Text("Acceleration").tag(1)
                } label: {
                    Text("ViewPicker??")
                }
                .pickerStyle(.segmented)
                switch viewSelection {
                case 0:  VelocityView()
                case 1:  MotionView()
                default:  Text("Nothing")
                }
            }
        }
    }
}
