//
//  UnoApp.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

@main
struct UnoApp: App {
    @StateObject var vm = HabitTrackingViewModel()
    var body: some Scene {
        
        WindowGroup {
            if UserDefaults.standard.bool(forKey: "onboardingShown") {
                HomeScreenTabView(vm: vm)
            } else {
                OnboardingView(vm: vm)
            }
        }
    }
}
