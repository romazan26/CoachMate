//
//  AddTrainingView.swift
//  CoachMate
//
//  Created by Роман on 07.09.2024.
//

import SwiftUI

struct AddTrainingView: View {
    @StateObject var vm: TrainingViewModel
    @Environment(\.dismiss) var dismiss
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //MARK: - Top tool bar
                HStack {
                    /// back buutton
                    Button(action: {dismiss()}, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 15, height: 22)
                    })
                    Spacer()
                    
                    /// Title view
                    Text("Training 27")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    /// Edit Training button
                    Button {
                       // vm.isPresentAddTraining.toggle()
                    } label: {
                        Image(systemName: "pencil")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 25, height: 25)
                    }
                    
                    
                }
                VStack(alignment: .leading){
                    
                    //MARK: - Date of training
                    Text(Dateformatter(date: Date()))
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .padding()
                    
                    //MARK: - Text training
                    MultiLineTF(txt: $vm.simpletextTraining, placehold: "Text training")
                        .frame(width: 331, height: 390)
                        .offset(y: -30)
                        .padding()
                        
                }
                .background(content: {
                    Color.second
                })
                .cornerRadius(21)
                
                Spacer()
                
                //MARK: - Add button
                Button {
                    vm.addTraining()
                } label: {
                    CustonButtonView(text: "Save")
                }
            }.padding()
        }
    }
}

#Preview {
    AddTrainingView(vm: TrainingViewModel())
}
//MARK: - Dateformatter
private func Dateformatter(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d.M.yyyy"
    return dateFormatter.string(from: date)
}
