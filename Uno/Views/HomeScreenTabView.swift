//
//  HomeScreenTabView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HomeScreenTabView: View {
    @ObservedObject var vm: HabitTrackingViewModel
    var body: some View {
        TabView {
            HomeScreenView(vm: vm)
                .tabItem {
                    Image(systemName: "house")
                        .foregroundStyle(.black)
                        
                }
            StatsView(/*vm: vm*/)
                .tabItem {
                    Image(systemName: "chart.xyaxis.line")
                }
        }
        .accentColor(.black)
        .toolbarColorScheme(.light, for: .tabBar)
    }
}

#Preview {
    HomeScreenTabView(vm: HabitTrackingViewModel())
}
