//
//  ContentView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onboardingShown") private var isOnboardingComplete: Bool = false
    @ObservedObject var vm: HabitTrackingViewModel
    var body: some View {
        Group {
            if isOnboardingComplete {
                HomeScreenView(vm: vm)
            } else {
                onboardingContent
            }
        }
    }
    
    private var onboardingContent: some View {
        VStack {
            TabView {
                OnboardingTextView(title: "Welcome", description: "Welcome! Ready to make small changes that add up to a big difference? Let's get started on building habits that help you reach your goals.")
                
                OnboardingTextView(title: "Why you should track your habits?", description: "Tracking habits helps you stay mindful of your daily actions. When you know what you're doing, you can see patterns, make adjustments, and celebrate progress.")
                
                OnboardingTextView(title: "How tracking can be beneficial?", description: "Building consistent habits strengthens self-discipline, improves focus, and leads to lasting results. Each day is a step forward toward the person you want to be!")
                
                VStack {
                    OnboardingTextView(title: "Ready to start?", description: "")
                    
                    Button {
                        isOnboardingComplete = true
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 30)
                                .frame(width: 160, height: 60)
                                .foregroundStyle(.orange)
                            
                            Text("Let's Go")
                                .foregroundStyle(.white)
                                .font(.title2)
                                .bold()
                        }
                    }
                    .offset(CGSize(width: 0, height: -300))
                }
            }
            .tabViewStyle(.page(indexDisplayMode: .always))
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingView(vm: HabitTrackingViewModel())
}
