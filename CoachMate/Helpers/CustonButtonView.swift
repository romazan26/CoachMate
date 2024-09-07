//
//  CustonButtonView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct CustonButtonView: View {
    
    var text = ""
    var isSheetButton = false
    var height: CGFloat = 84
    
    var body: some View {
        ZStack {
            Color.yellowApp.cornerRadius(50)
                HStack{
                    Text(text)
                        .foregroundStyle(.white)
                        .font(.system(size: 16, weight: .heavy))
                        .padding(.horizontal)
                    if isSheetButton{
                        Spacer()
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .frame(width: 53, height: 53)
                            .foregroundStyle(.white)
                    }
                }.padding()
            
        }.frame(height: height)
    }
}

#Preview {
    CustonButtonView(text: "Trainings", isSheetButton: true)
}
