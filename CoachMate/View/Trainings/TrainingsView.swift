//
//  TrainingsView.swift
//  CoachMate
//
//  Created by Роман on 07.09.2024.
//

import SwiftUI

struct TrainingsView: View {
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
                    Text("Trainings")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    /// Plus Training button
                    Button {
                        vm.isPresentAddTraining.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundStyle(.yellowApp)
                            .frame(width: 40, height: 40)
                    }

                    
                }
                
                //MARK: - Main stack
                VStack{
                    if vm.trainings.isEmpty{
                        Text("There is no training. Add the first workout")
                            .foregroundStyle(.white)
                            .padding(.top, 50)
                    }else{
                        ScrollView {
                            ForEach(vm.trainings.indices) { i in
                                // StudentCellView(student: vm.students[i], vm: vm, index: i)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    TrainingsView(vm: TrainingViewModel())
}
