//
//  HabitTrackingViewModel.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import Foundation
import UserNotifications

class HabitTrackingViewModel: NSObject, ObservableObject {
    @Published var habits: [HabitModel] = [
        HabitModel(id: 1, title: "Hi", imageString: "plus", reminderTime: .now)
    ]
    @Published var sendAlert: Bool = false
    
    override init() {
        super.init()
        UNUserNotificationCenter.current().delegate = self
    }
    
    /// A simple function to add insert new entry into the overall storage
    /// - Parameter habit: an instance of the `HabitModel.swift` struct, that captures all the important details.
    func addHabit(_ habit: HabitModel) {
        if habits.count <= 1 {
            habits.append(habit)
            scheduleNotification(habit)
        } else {
            sendAlert = true
        }
    }
    

    
    /// Takes care of setting up a notification when user creates a new `Habit` entity
    /// - Parameter habit: an instance of the `HabitModel.swift` struct, that captures all the important details.
    func scheduleNotification(_ habit: HabitModel) {
        requestNotificationAuthorization { authorized in
            if authorized {
                let content = UNMutableNotificationContent()
                content.title = "Habit Reminder! Time for - \(habit.title)"
                content.subtitle = "Stay on Track! Time to complete your habit for the day."
                content.sound = .default

                content.userInfo = ["habitId": habit.id]

                let calendar = Calendar.current
                var dateComponents = DateComponents()
                dateComponents.hour = calendar.component(.hour, from: habit.reminderTime)
                dateComponents.minute = calendar.component(.minute, from: habit.reminderTime)
                
                let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let request = UNNotificationRequest(
                    identifier: "habit-\(habit.id)",
                    content: content,
                    trigger: trigger
                )
                
                let streakContent = UNMutableNotificationContent()
                streakContent.title = "Habit Reminder! Time for - \(habit.title)"
                streakContent.subtitle = "Stay on Track! Time to complete your habit for the day."
                streakContent.sound = .default
                

                streakContent.userInfo = ["habitId": habit.id]
                

                let streakCalendar = Calendar.current
                var streakDateComponents = DateComponents()
                streakDateComponents.hour = calendar.component(.hour, from: habit.reminderTime)
                streakDateComponents.minute = calendar.component(.minute, from: habit.reminderTime)
                
                let streakTrigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
                
                let streakRequest = UNNotificationRequest(
                    identifier: "habit-\(habit.id)",
                    content: content,
                    trigger: trigger
                )
                
                let finalRequest = self.habits[1].totalTimesThisHabitWasCompleted > 5 ?  streakRequest : request
                UNUserNotificationCenter.current().add(finalRequest) { error in
                    if let error = error {
                        print("Error scheduling notification: \(error.localizedDescription)")
                    } else {
                        print("Notification scheduled for habit \(habit.id)")
                    }
                }
            }
        }
    }
    
    /// Request the system to allow the app to share
    func requestNotificationAuthorization(completion: @escaping (Bool) -> Void) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
            DispatchQueue.main.async {
                completion(success)
            }
        }
    }
    
    /// Updates the UI and associated properties when a push notif is clicked.
    /// - Parameter habitId: special Habit entity identifer
    func updateHabitCompletion(habitId: Int) {
        if let index = habits.firstIndex(where: { $0.id == habitId }) {
            DispatchQueue.main.async { [weak self] in
                self?.habits[index].isCompleted = true
                self?.habits[index].totalTimesThisHabitWasCompleted += 1
                self?.objectWillChange.send()
            }
        }
    }
}

extension HabitTrackingViewModel: UNUserNotificationCenterDelegate {
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        didReceive response: UNNotificationResponse,
        withCompletionHandler completionHandler: @escaping () -> Void
    ) {

        if let habitId = response.notification.request.content.userInfo["habitId"] as? Int {
            updateHabitCompletion(habitId: habitId)
        }
        
        completionHandler()
    }
    
    func userNotificationCenter(
        _ center: UNUserNotificationCenter,
        willPresent notification: UNNotification,
        withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void
    ) {
        completionHandler([.banner, .sound, .badge])
    }
}

