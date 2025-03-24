//
//  ContentView.swift
//  flutter-ios
//
//  Created by Bayu Nugroho on 21/03/25.
//

import SwiftUI
import Flutter

struct ContentView: View {
    // Flutter dependencies are passed in an EnvironmentObject.
    @EnvironmentObject var flutterDependencies: FlutterDependencies

    @State var counter = 0
    
    var body: some View {
        VStack {
            Text("Counter: \(counter)").font(.largeTitle)
            Button(action: {
                increaseCounter()
            }) {
                Text("Increase counter")
                    .font(.headline)
                    .padding()
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding(.vertical, 8)
            
            Button(action: {
                showFlutter()
            }) {
                Text("Open Flutter View")
                    .font(.headline)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }.padding(.vertical, 10)
        }
        
    }
    
    func increaseCounter() {
        self.counter+=1
    }
    
    func showFlutter() {
        guard
          let windowScene = UIApplication.shared.connectedScenes
            .first(where: { $0.activationState == .foregroundActive && $0 is UIWindowScene }) as? UIWindowScene,
          let window = windowScene.windows.first(where: \.isKeyWindow),
          let rootViewController = window.rootViewController
        else { return }

        // Create a FlutterViewController from pre-warm FlutterEngine
        let flutterViewController = FlutterViewController(
          engine: flutterDependencies.flutterEngine,
          nibName: nil,
          bundle: nil)
        flutterViewController.modalPresentationStyle = .overCurrentContext
        flutterViewController.isViewOpaque = false

        rootViewController.present(flutterViewController, animated: true)
      }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
