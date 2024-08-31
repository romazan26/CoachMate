//
//  StatisticCellView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct StatisticCellView: View {
    
    var title = ""
    var count = 0
    var widht: CGFloat = 0
    var sheetIcon = false
    
    var body: some View {
        ZStack {
            Color.second.cornerRadius(21)
            VStack(alignment: .leading) {
                //MARK: title
                Text(title)
                    .foregroundStyle(.white.opacity(0.64))
                .font(.system(size: 16))
                
                Spacer()
                //MARK: Count
                HStack{
                    Text("\(count)")
                        .foregroundStyle(.white)
                        .font(.system(size: 40, weight: .bold))
                    Spacer()
                    if sheetIcon {
                        Image(systemName: "chevron.right.circle.fill")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 28, height: 28)
                    }
                }
            }.padding()
        }.frame(width: widht, height: 110)
    }
}

#Preview {
    StatisticCellView(title: "Total students:", count: 24, widht: 161, sheetIcon: true)
}
