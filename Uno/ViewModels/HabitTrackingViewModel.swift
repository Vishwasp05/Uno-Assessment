//
//  HabitTrackingViewModel.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import Foundation

class HabitTrackingViewModel: ObservableObject {
    @Published var habits: [HabitModel] = [
        HabitModel(id: 1, title: "", imageString: "", reminderTime: .now)
    ]
    
    func addHabit(_ habit: HabitModel) {
        habits.append(habit)
    }
}
