//
//  TrainingView.swift
//  CoachMate
//
//  Created by Роман on 08.09.2024.
//

import SwiftUI

struct TrainingView: View {
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
                    Text("Training \(vm.simpleIndex)")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        .padding(.leading, 25)
                    
                    Spacer()
                                      
                    
                }
                ZStack(alignment: Alignment(horizontal: .leading, vertical: .center)) {
                    Color.second.cornerRadius(21)
                    VStack(alignment: .leading){
                        
                        //MARK: - Date of training
                        Text(Dateformatter(date: vm.simpleTraining.date ?? Date()))
                            .foregroundStyle(.white)
                            .font(.system(size: 20, weight: .heavy))
                        
                        //MARK: - Text training
                        
                        if vm.isEdit {
                            MultiLineTF(txt: $vm.simpletextTraining,
                                        placehold: vm.simpleTraining.text ?? "Text training")
                                .offset(y: -20)
                        }else{
                            Text("\(vm.simpleTraining.text ?? "")")
                                .foregroundStyle(.white)
                        }
                            
                          Spacer()
                            
                    }
                    .padding()
                    
                    
                }
                .frame(width: 331, height: 390)
                
                
                
                Spacer()
                
                //MARK: - Add button
                Button {
                    if vm.isEdit{
                        vm.editTraining()
                    }else{
                        vm.isEdit.toggle()
                    }
                    
                } label: {
                    CustonButtonView(text: vm.isEdit ? "Save" : "Edit")
                }
            }.padding()
        }
    }
}

//#Preview {
//    TrainingView(vm: TrainingViewModel())
//}

//MARK: - Dateformatter
private func Dateformatter(date: Date) -> String{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "d.M.yyyy"
    return dateFormatter.string(from: date)
}
