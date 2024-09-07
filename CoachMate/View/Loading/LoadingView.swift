//
//  LoadingView.swift
//  CoachMate
//
//  Created by Роман on 30.08.2024.
//

import SwiftUI

struct LoadingView: View {
    @State private var progress: Float = 0.0
    @State private var isPresent = false
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                Image(.logo)
                    .resizable()
                    .frame(width: 243, height: 120)
                    .padding(.top, 210)
                Spacer()
                VStack(spacing: 20) {
                    Text("- \(String(format: "%.0f", progress * 10) )% -")
                        .foregroundStyle(.white)
                        .font(.system(size: 16,weight: .heavy))
                    CustomProgressBar(progress: progress)
                }
            }
            .onAppear(perform: {
                Timer.scheduledTimer(withTimeInterval: 0.02, repeats: true) { timer in
                    if progress < 10{
                        progress += 0.1
                    }else {
                        timer.invalidate()
                        isPresent.toggle()
                    }
                }
            })
            .padding()
            
        }
        .fullScreenCover(isPresented: $isPresent, content: {
            StatisticsView()
        })
    }
}

#Preview {
    LoadingView()
}
