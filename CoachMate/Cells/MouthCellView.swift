//
//  MouthCellView.swift
//  CoachMate
//
//  Created by Роман on 08.09.2024.
//

import SwiftUI

struct MouthCellView: View {
    @ObservedObject var mouth: MouthSalary
    var body: some View {
        HStack {
            HStack {
                Text(mouth.mouth ?? "")
                    Spacer()
            }.frame(width: 100)
                
            Spacer()
            Rectangle()
                .frame(width: 1, height: 20)
            Spacer()
            Text("\(mouth.count)" )
                .frame(width: 30)
            Spacer()
            Rectangle()
                .frame(width: 1, height: 20)
            Spacer()
            Text("\(mouth.salary)")
                .frame(width: 70)
        }.padding(.horizontal)
                .foregroundStyle(.white.opacity(0.64))
    }
}

//#Preview {
//    MouthCellView(mouth: MouthSalary())
//}
