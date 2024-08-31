//
//  CustomProgressBar.swift
//  CoachMate
//
//  Created by Роман on 30.08.2024.
//

import SwiftUI

struct CustomProgressBar: View {
            var progress: Float = 15
            var body: some View {
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)){
                    RoundedRectangle(cornerRadius: 15)
                        .foregroundStyle(.black.opacity(0.16))
                    ZStack(alignment: Alignment(horizontal: .trailing, vertical: .center)) {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(.yellowApp)
                        .frame(width: CGFloat(progress * 33.5))
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 5, height: 21)
                            .foregroundStyle(.main)
                            .padding(.horizontal, 10)
                    }
                }
                .frame(width: 335,height: 43)
            }
        }


#Preview {
    CustomProgressBar()
}
