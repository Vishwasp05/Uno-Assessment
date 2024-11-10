//
//  HomeScreenView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HomeScreenView: View {
    @StateObject var vm = HabitTrackingViewModel()
    @State private var shouldPresentSheet: Bool = false
    
    var body: some View {
        VStack {

            HStack {
                VStack(alignment: .leading) {
                    Text("Good Afternoon!")
                        .kerning(1.5)
                        .font(.title)
                    
                    Text("Your Habit")
                        .kerning(1.5)
                        .font(.system(size: 45))
                        .bold()
                        .foregroundStyle(.orange)
                    
                    Spacer()
                }
                Spacer()
                
                ZStack {
                    Circle()
                        .frame(width: 80)
                        .foregroundStyle(.orange.opacity(0.5))
                    
                    Image(systemName: "trophy.fill")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                }
            }
            .padding()
            .frame(height: 120)
            
            

            List {
                ForEach(vm.habits.reversed()) { habit in
                    Button {
                        shouldPresentSheet.toggle()
                    } label: {
                        HabitCardIndividualView(habitName: habit.title,vm: vm, bgColor: .green, imageName: habit.imageString, isLastCell: vm.habits.count != 1, count: vm.habits.count, id: habit.id)
                    }
                }
                .listRowSeparator(.hidden)
            }
            .listStyle(.plain)
            .sheet(isPresented: $shouldPresentSheet) {
                HabitDetailView(vm: vm)
            }
            
            Spacer()
        }
    }
}

#Preview {
    HomeScreenView()
}
