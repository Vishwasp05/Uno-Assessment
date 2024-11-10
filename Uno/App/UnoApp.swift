//
//  UnoApp.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

@main
struct UnoApp: App {
    var body: some Scene {
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "onboardingShown") {
                HomeScreenTabView()
            } else {
                OnboardingView()
            }
        }
    }
}
