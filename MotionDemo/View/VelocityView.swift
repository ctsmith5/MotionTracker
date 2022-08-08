//
//  VelocityView.swift
//  MotionDemo
//
//  Created by Colin Smith on 8/5/22.
//

import SwiftUI
import LocationService

struct VelocityView: View {
    @ObservedObject var viewModel = VelocityViewModel()
    var body: some View {
        VStack {
        Text("Current Location")
            Text(viewModel.locationClient.address)
        Text("Velocity")
        Text("\(viewModel.velocity)")
            
        Spacer()
        Text("Max Velocity")
        Text("\(viewModel.maxVelocity)")
            
        Button(action: {
            viewModel.resetVelocity()
        }, label: {
            Text("Reset")
                .bold()
                .padding()
                .background(Color.blue)
                .foregroundColor(Color.white)
                .cornerRadius(8)
            
        })
    }
        .font(.largeTitle)
        Spacer()
            .onAppear {
                Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
                    viewModel.updateVelocity()
                }
                viewModel.getLocation()
            }
    }
}

struct VelocityView_Previews: PreviewProvider {
    static var previews: some View {
        VelocityView()
    }
}
