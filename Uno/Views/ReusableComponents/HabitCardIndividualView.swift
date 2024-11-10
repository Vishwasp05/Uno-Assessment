//
//  HabitCardIndividualView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HabitCardIndividualView: View {
    let habitName: String
    let vm: HabitTrackingViewModel
    let bgColor: Color
    let imageName: String
    let isLastCell: Bool
    let count: Int
    let id: Int
    var body: some View {
        
        VStack{
            if count != 1 && id != 1{
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(bgColor)
                    
                    HStack{
                        Image(systemName: imageName)
                            .font(.system(size: 80))
                            .padding(.leading, 10)
                        
                        Text(habitName)
                            .font(.title)
                            .bold()
                            .foregroundStyle(.black)
                        
                        Spacer()
                        
                        Image(systemName: vm.habits[1].isCompleted ? "checkmark.circle.fill" : "plus.circle.fill")

                            .font(.title3)
                            .padding()
                        
                    }
                }
            } else {
                ZStack {
                    RoundedRectangle(cornerRadius: 18)
                        .strokeBorder(style: StrokeStyle(lineWidth: 3, dash: [10]))
                        .foregroundStyle(.black)
                    
                    HStack{
                        Button {
                          // add new habit
                        }label: {
                            ZStack{
                                Circle()
                                    .frame(width: 70)
                                    .foregroundStyle(.orange)
                                Image(systemName: "plus")
                                    .font(.title)
                                    .bold()
                                    .foregroundStyle(.white)
                            }
                            
                    
                        }
                        .padding()
                        Spacer()
                        
                        Text("Add a new habit")
                            .font(.title)
                    
                        
                        Spacer()
                    }
                    
                    
                
                    
                }
                .opacity(0.2)
                            }
                
        }
        .frame(width: 350, height: 130)
    }
}

#Preview {
    HabitCardIndividualView(habitName: "", vm: HabitTrackingViewModel(), bgColor: .yellow, imageName: "figure.pool.swim", isLastCell: true, count: 0, id: 1)
}
