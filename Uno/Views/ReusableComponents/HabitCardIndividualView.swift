//
//  HabitCardIndividualView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct HabitCardIndividualView: View {
    let bgColor: Color
    let imageName: String
    let isLastCell: Bool
    var body: some View {
        VStack{
            if !isLastCell{
                ZStack{
                    RoundedRectangle(cornerRadius: 18)
                        .foregroundStyle(bgColor)
                    
                    HStack{
                        Image(systemName: imageName)
                            .font(.system(size: 80))
                            .padding(.leading, 10)
                        
                        Text("Swimming")
                            .font(.title)
                            .bold()
                            .foregroundStyle(.white)
                        
                        Spacer()
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
    HabitCardIndividualView(bgColor: .purple, imageName: "figure.pool.swim", isLastCell: true)
}
