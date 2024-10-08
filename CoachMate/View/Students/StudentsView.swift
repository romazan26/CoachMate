//
//  StudentsView.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import SwiftUI

struct StudentsView: View {
    @StateObject var vm: StudentViewModel
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
                    Text("Students")
                        .foregroundStyle(.white)
                        .font(.system(size: 32, weight: .heavy))
                        .padding(.leading, 25)
                    
                    Spacer()
                    
                    /// Plus student button
                    Button {
                        vm.isPresentAddStudents.toggle()
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .foregroundStyle(.yellowApp)
                            .frame(width: 40, height: 40)
                    }

                    
                }
                
                //MARK: - Main stack
                VStack{
                    ScrollView {
                        ForEach(vm.students.indices, id: \.self) { i in
                            StudentCellView(student: vm.students[i], vm: vm, index: i)
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            //MARK: - Add student
            if vm.isPresentAddStudents{
                AddStudentView(vm: vm)
            }
        }
        .animation(.easeInOut, value: vm.students)
        .animation(.easeInOut, value: vm.isPresentAddStudents)
    }
}

#Preview {
    StudentsView(vm: StudentViewModel())
}
