//
//  TravelBuddyApp.swift
//  TravelBuddy
//
//  Created by Linus Obermayr on 2023-04-18.
//

import SwiftUI
import Firebase

@main
struct TravelBuddyApp: App {
    
    init() {
        FirebaseApp.configure()
    }
  
    var body: some Scene {
        WindowGroup {
            RootView()
        }
    }
}
