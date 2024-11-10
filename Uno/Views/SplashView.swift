//
//  SplashView.swift
//  Uno
//
//  Created by Vishwas Sharma on 10/11/24.
//

import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack{
            Color.orange
            
            Text("UNO")
                .font(.system(size: 100))
                .italic()
                .bold()
                .underline()
        }
        .ignoresSafeArea()
    }
}

#Preview {
    SplashView()
}
