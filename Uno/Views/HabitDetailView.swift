//
//  HabitDetailView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HabitDetailView: View {
    
    let sfSymbols = [
        "star", "heart", "bell", "gear", "paperclip", "envelope", "camera", "magnifyingglass", "flag", "phone",
        "trash", "lock", "key", "calendar", "bookmark", "person", "wifi", "pencil", "folder", "doc", "cloud",
        "bolt", "music.note", "book", "cart", "cube", "phone.fill", "house", "lightbulb", "tv", "airplane", "suitcase",
        "applelogo", "camera.fill", "cloud.fill", "book.fill", "printer", "archivebox", "video", "icloud", "arrow.up", "arrow.down",
        "play", "pause", "stop", "forward.fill", "backward.fill", "shuffle", "repeat", "repeat.1", "battery.100", "battery.50",
        "battery.0", "paperplane", "app.badge.plus", "app.badge.minus", "star.fill", "heart.fill", "circle", "square", "rectangle",
        "play.circle", "pause.circle", "stop.circle", "arrow.circle.right", "arrow.circle.left", "plus.circle", "minus.circle",
        "plus.square", "minus.square", "xmark", "checkmark", "pencil.circle", "scribble", "keyboard", "mic", "eye", "eye.fill",
        "wifi.circle", "wifi.slash", "circle.fill", "square.fill", "rectangle.fill", "arrow.up.right", "arrow.down.left", "ellipsis",
        "line.horizontal.3", "line.horizontal.3.decrease", "line.horizontal.3.increase", "dot.circle", "circle.grid.2x2", "triangle",
        "rectangle.stack", "bolt.fill", "flame", "sun.min", "moon", "cloud.sun", "cloud.moon", "cloud.rain", "cloud.snow",
        "thermometer", "leaf.arrow.circlepath", "clock", "alarm", "star.lefthalf.fill", "star.righthalf.fill", "cube.fill", "cube",
        "file", "person.fill", "briefcase", "house.fill", "folder.fill", "folder.badge.plus", "folder.badge.minus", "creditcard",
        "banknote", "wand.and.stars", "flame.fill", "camera.macro", "scribble.variable", "gamecontroller", "guitars", "headphones",
        "mic.fill", "speaker", "carkey", "hand.raised", "umbrella", "cloud.drizzle", "pencil.and.outline", "hand.heart", "pencil.tip",
        "applewatch", "airpods", "wand.and.stars.fill"
    ]

    @ObservedObject var vm = HabitTrackingViewModel()
    @State private var displayTime: String = "9:00 PM"
    @State private var description: String = ""
    @State private var title: String = ""
    @State private var selectedTime = Date()
    @State private var sendAlerts = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack{
            Text("New Habit")
                .font(.title)
            
            Text("\(Date.now.formatted(.dateTime.day().month()))")
                .font(.system(size: 50))
                .foregroundStyle(.orange)
                .bold()
                .kerning(2)
            
            Spacer()
            VStack{
                Text("Habit Description").padding(.trailing, 200)
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(.green.opacity(0.5))
                    
                    HStack{
                        ZStack{
                            RoundedRectangle(cornerRadius: 11)
                                .foregroundStyle(.white)
                            
                            TextField("Add title", text: $title)
                                .padding()
                        }
                        .frame(width: 330, height: 50)
                    }.frame(height: 70)
                    
                }
                
                // remind button
                
                Text("When should we remind you?").padding(.trailing, 110)
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(.blue.opacity(0.5))
                    
                    HStack{
                        
                        Text("Remind me at:")
                            .font(.headline)
                            .multilineTextAlignment(.center)
                            .foregroundStyle(.white)
                        Spacer()
//                       
                        DatePicker("", selection: $selectedTime, displayedComponents: .hourAndMinute)
                        .datePickerStyle(.compact)
                     }
                    .frame(width: 300, height: 35)
                    .padding()
                    
                }
            }
            .frame(width: 350, height: 75)
            
            Spacer()
            

            Spacer()
            
            ZStack{
                RoundedRectangle(cornerRadius: 40)
                    .foregroundStyle(.green.opacity(0.6))
                
                Button {
                    // send data to the viewModel
                    let habit = HabitModel(id: Int.random(in: 0...11000), title: title, imageString: sfSymbols.randomElement()!, reminderTime: selectedTime)
                    
                    if vm.sendAlert {
                        sendAlerts.toggle()
                        
                    }else{
                        vm.addHabit(habit)
                        dismiss()
                    }
                    
                } label: {
                    Text("Log")
                        .foregroundStyle(.white)
                        .font(.title)
                        .bold()
                }
            }
            .frame(width: 130, height: 70)
            .alert(isPresented: $vm.sendAlert, content: {
                Alert(title: Text("Caution 💀"), message: Text("This assignment only allows one task!"), dismissButton: .cancel({
                    dismiss()
                }))
            })
               
            
            Spacer()
        }
        
    }
}


#Preview {
    HabitDetailView()
}
