//
//  FlutterView.swift
//  flutter-ios
//
//  Created by Bayu Nugroho on 24/03/25.
//

import Foundation
import SwiftUI
import Flutter

struct FlutterView: UIViewControllerRepresentable {
    @ObservedObject var flutterManager: FlutterManager

    func makeUIViewController(context: Context) -> FlutterViewController {
        guard let flutterEngine = flutterManager.getFlutterEngine() else {
            return FlutterViewController()
        }
        return FlutterViewController(engine: flutterEngine, nibName: nil, bundle: nil)
    }

    func updateUIViewController(_ uiViewController: FlutterViewController, context: Context) {}
}
