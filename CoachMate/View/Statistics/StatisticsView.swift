//
//  StatisticsView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var studentVM = StudentViewModel()
    @StateObject var trainingVM = TrainingViewModel()
    
    var body: some View {
            ZStack {
                Color.main.ignoresSafeArea()
                VStack {
                    
                    //MARK: - Top tool bar
                    HStack {
                        //MARK: Title view
                        Text("Statistics")
                            .foregroundStyle(.white)
                            .font(.system(size: 32, weight: .heavy))
                        
                        Spacer()
                        //MARK: Settings button
                        Image(systemName: "gearshape")
                            .resizable()
                            .foregroundStyle(.white)
                            .frame(width: 27, height: 27)
                    }
                    
                    //MARK: - Main stack
                    VStack{
                        HStack{
                            ///Total student
                            Button(action: {studentVM.isPresentStudents.toggle()}, label: {
                                StatisticCellView(title: "Total students:",
                                                  count: studentVM.students.count,
                                                  widht: 161,
                                                  sheetIcon: true)
                            })
                           
                            ///Payd
                            StatisticCellView(title: "Payd:",
                                              count: studentVM.getPaid(),
                                              widht: 161)
                        }
                        HStack{
                            ///Didn’t pay
                            StatisticCellView(title: "Didn’t pay",
                                              count: studentVM.getDontPay(),
                                              widht: 120)
                            ///Payd
                            StatisticCellView(title: "\(studentVM.Dateformatter(date: Date())) salary:",
                                              count: Int(studentVM.getSalaryMouth()),
                                              widht: 202)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    Button {
                        trainingVM.isPresentTrainings.toggle()
                    } label: {
                        CustonButtonView(text: "Trainings", isSheetButton: true)
                    }

                    
                }
                .fullScreenCover(isPresented: $trainingVM.isPresentTrainings, content: {
                    TrainingsView(vm: trainingVM)
                })
                .fullScreenCover(isPresented: $studentVM.isPresentStudents, content: {
                    StudentsView(vm: studentVM)
                })
                .padding()
        }
    }
}

#Preview {
    StatisticsView()
}
