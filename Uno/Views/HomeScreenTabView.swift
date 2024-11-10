//
//  HomeScreenTabView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HomeScreenTabView: View {
    var body: some View {
        TabView {
            HomeScreenView()
                .tabItem {
                    Image(systemName: "house")
                        .foregroundStyle(.black)
                        
                }
             OnboardingView()
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                }
        }
        .accentColor(.black)
        .toolbarColorScheme(.light, for: .tabBar)
    }
}

#Preview {
    HomeScreenTabView()
}
