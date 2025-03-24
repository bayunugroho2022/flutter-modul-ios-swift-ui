//
//  flutter_iosApp.swift
//  flutter-ios
//
//  Created by Bayu Nugroho on 21/03/25.
//

import SwiftUI
import Flutter

class FlutterDependencies: ObservableObject {
    let flutterEngine = FlutterEngine(name: "flutter-engine")
    init() {
        flutterEngine.run()
    }
}

@main
struct flutter_iosApp: App {
    @StateObject var flutterDependencies = FlutterDependencies()

    var body: some Scene {
            WindowGroup {
                ContentView().environmentObject(flutterDependencies)
            }
        }
}
