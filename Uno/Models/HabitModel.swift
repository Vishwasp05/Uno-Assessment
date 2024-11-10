//
//  HabitModel.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import Foundation

struct HabitModel: Identifiable {
    var id: Int
    let title: String
    let imageString: String
    let reminderTime: Date
}
