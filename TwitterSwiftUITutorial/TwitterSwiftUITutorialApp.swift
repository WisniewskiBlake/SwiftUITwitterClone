//
//  TwitterSwiftUITutorialApp.swift
//  TwitterSwiftUITutorial
//
//  Created by Blake Wisniewski on 12/18/1399 AP.
//

import SwiftUI
import Firebase

@main
struct TwitterSwiftUITutorialApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(AuthViewModel.shared)
        }
    }
}
