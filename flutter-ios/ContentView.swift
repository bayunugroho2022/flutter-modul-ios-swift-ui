//
//  ContentView.swift
//  flutter-ios
//
//  Created by Bayu Nugroho on 21/03/25.
//

import SwiftUI
import Flutter

struct ContentView: View {
    @StateObject private var flutterManager = FlutterManager()
    @State private var isFlutterViewPresented = false

    var body: some View {
        VStack {
            Text("Counter: \(flutterManager.counter)").font(.largeTitle)

            Button("Increase counter") {
                increaseCounter()
            }
            .buttonStyle(CustomButtonStyle(color: .yellow))

            Button("Open Flutter View") {
                showFlutter()
            }
            .buttonStyle(CustomButtonStyle(color: .blue))
        }
        .fullScreenCover(isPresented: $isFlutterViewPresented, onDismiss: {
            flutterManager.stopEngine()
        }) {
            FlutterView(flutterManager: flutterManager)
        }
    }

    private func increaseCounter() {
        flutterManager.counter += 1
        flutterManager.submitCounter()
    }

    private func showFlutter() {
        flutterManager.startEngine()
        isFlutterViewPresented = true
    }
}


struct CustomButtonStyle: ButtonStyle {
    var color: Color

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding()
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(10)
            .opacity(configuration.isPressed ? 0.8 : 1.0)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
