//
//  TrainingCellView.swift
//  CoachMate
//
//  Created by Роман on 08.09.2024.
//

import SwiftUI

struct TrainingCellView: View {
    
    let training: Training
    
    @StateObject var vm: TrainingViewModel
    var index = 0
    var body: some View {
        ZStack {
            Color.second.cornerRadius(21)
            HStack {
                VStack(alignment: .leading) {
                    Text(Dateformatter(date: training.date ?? Date()))
                        .foregroundStyle(.white.opacity(0.64))
                    Text("Training №\(index + 1)")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                }
                Spacer()
                
                Rectangle()
                    .frame(width: 1, height: 43)
                    .foregroundStyle(.white)
                    .padding(.horizontal)
                Image(systemName: "checkmark.circle.fill")
                    .resizable()
                    .frame(width: 26, height: 26)
                    .foregroundStyle(.white)
            }.padding()
        }
        .frame(height: 84)
    }
}

//#Preview {
//    TrainingCellView()
//}
//MARK: - Dateformatter
private func Dateformatter(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d.M.yyyy"
    return dateFormatter.string(from: date)
    }
