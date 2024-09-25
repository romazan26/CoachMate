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
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            VStack {
                
                //MARK: - Top tool bar
                HStack {
                    /// back buutton
                    Button(action: {
                        dismiss()
                        vm.simpletextTraining = ""
                    }, label: {
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 15, height: 22)
                    })
                    Spacer()
                    
                    /// Title view
                    Text("New Training")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        //.padding(.leading, 25)
                    
                    Spacer()
                    
                    
                    
                    
                }
                VStack(alignment: .leading){
                    
                    //MARK: - Date of training
                    Text(Dateformatter(date: Date()))
                        .foregroundStyle(.white)
                        .font(.system(size: 20, weight: .heavy))
                        .padding()
                    
                    //MARK: - Text training
                    MultiLineTF(txt: $vm.simpletextTraining, placehold: "Text training")
                        .focused($keyboardIsFocused)
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
                    dismiss()
                } label: {
                    CustonButtonView(text: "Save")
                }
            }.padding()
                .navigationBarBackButtonHidden()
        }
        .onTapGesture {
            keyboardIsFocused = false
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
