//
//  StatsView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

//import SwiftUI
//import Charts
//
//struct StatsView: View {
//    @ObservedObject var vm: HabitTrackingViewModel
//    @State private var totalUsage = 0
//    @State private var dataPoints: [(x: Int, y: Int)] = []
//
//    var body: some View {
//        Chart {
//            ForEach(dataPoints, id: \.x) { point in
//                LineMark(
//                    x: .value("Time", point.x),
//                    y: .value("Total Usage", point.y)
//                )
//            }
//        }
//        .onAppear {
//            // Calculate total usage and populate `dataPoints`
//            totalUsage = vm.habits.map(\.totalTimesThisHabitWasCompleted).reduce(0, +)
//            
//            // Example: Creating data points for the chart
//            dataPoints = vm.habits.enumerated().map { index, habit in
//                (x: index, y: habit.totalTimesThisHabitWasCompleted)
//            }
//        }
//    }
//}
//
//#Preview {
//    StatsView(vm: HabitTrackingViewModel())
//}

// THANKS to AI, dummy data is available fast :)
import SwiftUI
import Charts


struct StatsView: View {
    @State private var totalUsage = 0
    @State private var dataPoints: [(x: Int, y: Int)] = []
    @State private var habits: [HabitModel] = [
        HabitModel(id: 1, title: "Exercise", imageString: "exercise_icon", reminderTime: Date(), totalTimesThisHabitWasCompleted: 10),
        HabitModel(id: 2, title: "Reading", imageString: "reading_icon", reminderTime: Date(), totalTimesThisHabitWasCompleted: 15),
        HabitModel(id: 3, title: "Meditation", imageString: "meditation_icon", reminderTime: Date(), totalTimesThisHabitWasCompleted: 7),
        HabitModel(id: 4, title: "Coding", imageString: "coding_icon", reminderTime: Date(), totalTimesThisHabitWasCompleted: 20),
        HabitModel(id: 5, title: "Cooking", imageString: "cooking_icon", reminderTime: Date(), totalTimesThisHabitWasCompleted: 5)
    ]
    
    var body: some View {
        VStack{
            Text("Stats")
                .font(.largeTitle)
                .bold()
                .kerning(2)
                .foregroundStyle(.green)
            Chart {
                ForEach(dataPoints, id: \.x) { point in
                    LineMark(
                        x: .value("Habit", point.x),
                        y: .value("Total Usage", point.y)
                    )
                    .foregroundStyle(.orange)
                }
            }
            .onAppear {
                // Calculate total usage and populate dataPoints with dummy data
                totalUsage = habits.map(\.totalTimesThisHabitWasCompleted).reduce(0, +)
                
                // Create data points based on habit usage counts for the chart
                dataPoints = habits.enumerated().map { index, habit in
                    (x: index, y: habit.totalTimesThisHabitWasCompleted)
                }
            }
        }
        .frame(width: 300, height: 500)
    }
}

#Preview {
    StatsView()
}
