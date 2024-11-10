# Uno Habit Tracker - Tech Assignment - Vishwas Sharma 

Uno is a simple habit-tracking app for iOS. The app allows users to set and track one habit, receive daily reminders, and view their progress over time.

## Features

1. **Splash Screen**: 
   - A quick introduction screen when the app launches.

2. **Onboarding**:
   - A 3-page onboarding experience that explains how to use the app.
   - Uses `UserDefaults` to check if the onboarding has been shown, so it only appears once.

3. **Home Screen with Tab Bar**:
   - The main screen has two tabs:
     - **Habit List**: Users can add one habit and set a reminder for it.
     - **Stats**: Displays progress and statistics for the habit.

4. **Habit Tracking**:
   - Users can add one habit to track and set a reminder for it.
   - When the notification is tapped, the habit item displays a checkmark icon to show it was completed.

5. **Push Notifications**:
   - Users set a time for daily reminders to build their habit.
   - A push notification is sent at the set time each day.

## Technical Highlights

- **MVVM Architecture**:
  - The app is organized using MVVM (Model-View-ViewModel), making it simple and scalable.
  - Each part of the app is separated into layers: Model for data, ViewModel for logic, and View for UI.

- **Learning Outcomes**:
  1. **Effective Resource Usage**: Used online resources such as Google Search, Stack Overflow, technical articles, and AI tools to learn new skills and solve problems.
  2. **Understanding iOS Notifications**: Gained a basic understanding of how to set up and trigger push notifications on iOS.
  3. **MVVM in iOS**: Implemented a simple MVVM structure, allowing better code organization.
 
- **Technical Documentation**
  1. The `viewModel` features simple, documentation of what each function is supposed to bu doing Swift DocC. 

## Future Improvements

- Replace dummy data in the stats section with real-time habit tracking data.
- Add more customization options for the habit and notification settings.

## How to Use the App

1. **Install** the app and launch it. The splash screen will show briefly.
2. **Onboarding**: Go through the 3-page onboarding to understand how the app works.
3. **Set a Habit**: Add a habit to track on the home screen, including a reminder time.
4. **Receive Notifications**: At the selected time each day, a notification will remind you to complete the habit.
5. **View Stats**: Check the stats page to see your progress over time. 

In the end I would like to thank you for providing me with the opportunity to sit for this assessment. Hope to take the learnings and cement them with regualr practice. 
Best, 
Vishwas Sharma

