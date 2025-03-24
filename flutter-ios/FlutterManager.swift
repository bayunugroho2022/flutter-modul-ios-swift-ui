//
//  FlutterDependencies.swift
//  flutter-ios
//
//  Created by Bayu Nugroho on 24/03/25.
//

import Flutter

class FlutterManager: ObservableObject {
    private var flutterEngine: FlutterEngine?
    private var methodChannel: FlutterMethodChannel?
    @Published var counter: Int = 0
    
    func startEngine() {
        flutterEngine = FlutterEngine(name: "flutter-engine")
        flutterEngine?.run()
        setupMethodChannel()
    }

    func stopEngine() {
        flutterEngine = nil
        methodChannel = nil
    }

    func getFlutterEngine() -> FlutterEngine? {
        return flutterEngine
    }

    private func setupMethodChannel() {
        guard let engine = flutterEngine else { return }
        methodChannel = FlutterMethodChannel(name: "flutter_channel/counter", binaryMessenger: engine.binaryMessenger)
        
        methodChannel?.setMethodCallHandler { [weak self] (call, result) in
            guard let self = self else { return }
            switch call.method {
            case "increaseCounter":
                self.counter += 1
                self.submitCounter()
            case "getCounter":
                self.submitCounter()
            default:
                print("Unrecognized method: \(call.method)")
            }
        }
    }

    func submitCounter() {
        methodChannel?.invokeMethod("submitCounter", arguments: counter)
    }
}


