//
//  MotionView.swift
//  MotionDemo
//
//  Created by Colin Smith on 8/2/22.
//

import SwiftUI

struct MotionView: View {
    @ObservedObject var viewModel = MotionViewModel()
    var body: some View {
        VStack {
                VStack {
                    Text("Total")
                    Text("\(viewModel.maxTotalVector)")
                    HStack {
                        VStack {
                            Text("Turning")
                            Text("\(viewModel.turningVector)")
                        }
                        VStack {
                            Text("Linear")
                            Text("\(viewModel.accelerationZ)")
                        }
                    }
                }
                .font(.largeTitle)
            Spacer()
            Button {
                viewModel.resetData()
            } label: {
                Text("Reset")
                    .bold()
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(Color.white)
                    .cornerRadius(8)
            }
            Spacer()
            VStack {
                Text("Max Acceleration")
                HStack {
                    VStack {
                        Text("X")
                        Text("\(viewModel.maxAccelerationX)")
                    }
                    VStack {
                        Text("Y")
                        Text("\(viewModel.maxAccelerationY)")
                    }
                    VStack {
                        Text("Z")
                        Text("\(viewModel.maxAccelerationZ)")
                    }
                }
                VStack {
                    Text("Total")
                    Text("\(viewModel.maxTotalVector)")
                    HStack {
                        VStack {
                            Text("Turning")
                            Text("\(viewModel.maxTurningVector)")
                        }
                        VStack {
                            Text("Linear")
                            Text("\(viewModel.maxAccelerationZ)")
                        }
                    }
                }
                .font(.title)
            }
         Spacer()
        }
        .onAppear {
            viewModel.startUpdate()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MotionView()
    }
}
