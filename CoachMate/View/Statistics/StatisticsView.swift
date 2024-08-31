//
//  StatisticsView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct StatisticsView: View {
    
    @StateObject var studentVM = StudentViewModel()
    
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
                                                  count: 24,
                                                  widht: 161,
                                                  sheetIcon: true)
                            })
                           
                            ///Payd
                            StatisticCellView(title: "Payd:",
                                              count: 16,
                                              widht: 161)
                        }
                        HStack{
                            ///Didn’t pay
                            StatisticCellView(title: "Didn’t pay",
                                              count: 19,
                                              widht: 120)
                            ///Payd
                            StatisticCellView(title: "July salary:",
                                              count: 20000,
                                              widht: 202)
                        }
                        
                        Spacer()
                        
                    }
                    
                    Spacer()
                    
                    CustonButtonView(text: "Trainings", isSheetButton: true)
                }
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
