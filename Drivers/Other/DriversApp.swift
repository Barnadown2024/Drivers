//
//  DriversApp.swift
//  Drivers
//
//  Created by Diarmuid on 18/01/2025.
//

import FirebaseCore
import SwiftUI

@main
struct DriversApp: App {
    init () {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
