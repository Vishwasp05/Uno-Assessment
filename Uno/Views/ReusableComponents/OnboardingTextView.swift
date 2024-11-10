//
//  OnboardingTextView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct OnboardingTextView: View {
    let title: String
    let description: String
    var body: some View {
        ZStack {
            VStack{
                Text(title)
                    .font(.largeTitle)
                    .multilineTextAlignment(.center)
                    .bold()
                    .kerning(1.5)
                    .foregroundStyle(.orange)
                    .padding(.bottom, 10)
                
                Text(description)
                    .font(.title2)
                    .kerning(2)
                    .multilineTextAlignment(.center)
            }
            .frame(width: 360)
            
            ZStack{
                Circle()
                    .offset(CGSize(width: 0, height: 500))
                    .frame(width: 500)
                    .foregroundStyle(.orange.opacity(1.5))
                
                FaceShape()
                    .stroke(Color.white, lineWidth: 8)
                    .frame(width: 500 * 0.45)
                    .offset(y: 450 - 450 * 0.15)
            }
                
        }
    }
}


struct FaceShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let width = rect.width
        let height = rect.height - 50
        
       
        let leftEyePath = UIBezierPath()
        leftEyePath.move(to: CGPoint(x: width * 0.25, y: height * 0.45))
        leftEyePath.addQuadCurve(
            to: CGPoint(x: width * 0.35, y: height * 0.45),
            controlPoint: CGPoint(x: width * 0.3, y: height * 0.35)
        )
        
      
        let rightEyePath = UIBezierPath()
        rightEyePath.move(to: CGPoint(x: width * 0.65, y: height * 0.45))
        rightEyePath.addQuadCurve(
            to: CGPoint(x: width * 0.75, y: height * 0.45),
            controlPoint: CGPoint(x: width * 0.7, y: height * 0.35)
        )
        
       
        let smilePath = UIBezierPath()
        smilePath.move(to: CGPoint(x: width * 0.3, y: height * 0.52))
        smilePath.addQuadCurve(
            to: CGPoint(x: width * 0.7, y: height * 0.52),
            controlPoint: CGPoint(x: width * 0.5, y: height * 0.56)
        )
        
    
        path.addPath(Path(leftEyePath.cgPath))
        path.addPath(Path(rightEyePath.cgPath))
        path.addPath(Path(smilePath.cgPath))
        
        return path
    }
}
#Preview {
    OnboardingTextView(title: "Why track your habits?", description: "Tracking habits helps you stay mindful of your daily actions. When you know what you’re doing, you can see patterns, make adjustments, and celebrate progress.")
}
