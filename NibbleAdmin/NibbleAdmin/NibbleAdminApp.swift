//
//  NibbleAdminApp.swift
//  NibbleAdmin
//
//  Created by Charles Coppieters 't Wallant on 12/1/21.
//

import SwiftUI
import Firebase

@main
struct NibbleAdminApp: App {
    init() {
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
