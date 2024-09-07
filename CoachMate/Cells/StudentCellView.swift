//
//  StudentCellView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct StudentCellView: View {
    
    @ObservedObject var student: Student
    @ObservedObject var vm: StudentViewModel
    var index = 0
    
    var body: some View {
        ZStack {
            Color.second.cornerRadius(21)
            HStack {
                VStack(alignment: .leading) {
                    Text("Student \(index + 1):")
                        .foregroundStyle(.white.opacity(0.64))
                    Text(student.name ?? "")
                        .foregroundStyle(.white)
                        .font(.system(size: 24, weight: .bold))
                }
                Spacer()
                
                //MARK: Delete button
                Button(action: {vm.deleteStudent(student: student)}, label: {
                    Image(systemName: "trash")
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                })
                
                //MARK: Pay button
                Button(action: {
                    vm.payStudent(id: student.id)
                    vm.addSalary()
                }, label: {
                    Text("Pay")
                        .foregroundStyle(.black)
                        .font(.system(size: 16, weight: .bold))
                        .padding(10)
                        .padding(.horizontal)
                        .background {
                            Color(student.pay ? .gray : .white)
                                .cornerRadius(29)
                        }
                }).disabled(student.pay ? true : false)
            }.padding()
        }
        .frame(height: 84)
    }
}

//#Preview {
//    StudentCellView(student: Student(), vm: StudentViewModel())
//}
