//
//  HomeScreenView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

//import SwiftUI
//
//struct HomeScreenView: View {
//    
//    @StateObject var vm = HabitTrackingViewModel()
//    
//    @State private var shouldPresentSheet: Bool = false
//    var body: some View {
//        VStack {
//            HStack {
//                VStack(alignment: .leading){
//                    Text("Good Afternoon!")
//                        .kerning(1.5)
//                        .font(.title)
//                    
//                  
//                    Text("Your Habit")
//                            .kerning(1.5)
//                            .font(.system(size: 45))
//                            .bold()
//                            .foregroundStyle(.orange)
//                        Spacer()
//                }
//                Spacer()
//                
//                ZStack{
//                    Circle()
//                        .frame(width: 80)
//                        .foregroundStyle(.orange.opacity(0.5))
//                    
//                    Image(systemName: "trophy.fill")
//                        .font(.largeTitle)
//                        .foregroundStyle(.white)
//                }
//                
//                
//            }
//            .padding()
//            .frame(height: 120)
//            
//            
//
//            List {
//                ForEach(0..<Int(vm.habits.count)) { index in
//                    let habits = vm.habits[index]
//                    
//                    Button {
//                        
//                    } label: {
//                        HabitCardIndividualView(bgColor: .purple, imageName: habits.imageString, isLastCell: index == vm.habits.count - 1 )
//                    }
//                }
//            }
//            
//            
//            Spacer()
//        }
//    }
//}
//
//#Preview {
//    HomeScreenView()
//}


import SwiftUI

struct HomeScreenView: View {
    @StateObject var vm = HabitTrackingViewModel()
    @State private var shouldPresentSheet: Bool = false
    
    var body: some View {
        VStack {
            // Header Section
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
            
            // Habit List Section
            List {
                ForEach(vm.habits.indices, id: \.self) { index in
                    let habit = vm.habits[index]
                    
                    Button {
                        // Action for tapping the habit card
                        if index == vm.habits.count - 1 {
                            shouldPresentSheet.toggle()
                        }
                    } label: {
                        HabitCardIndividualView(
                            bgColor: .purple,
                            imageName: habit.imageString,
                            isLastCell: index == vm.habits.count - 1
                        )
                    }
                }
                .listRowSeparator(.hidden) // Hide separator if needed
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
