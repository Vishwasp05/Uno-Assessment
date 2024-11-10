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
    @State private var showSplash = true
    
    var body: some Scene {
        WindowGroup {
            Group {
                if showSplash {
                    SplashView()
                        .transition(.opacity)
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                withAnimation(.easeInOut(duration: 1.5)) {
                                    showSplash = false
                                }
                            }
                        }
                } else {
                    if UserDefaults.standard.bool(forKey: "onboardingShown") {
                        HomeScreenTabView(vm: vm)
                    } else {
                        OnboardingView(vm: vm)
                    }
                }
            }
        }
    }
}
