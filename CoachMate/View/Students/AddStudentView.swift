//
//  AddStudentView.swift
//  CoachMate
//
//  Created by Роман on 07.09.2024.
//

import SwiftUI

struct AddStudentView: View {
    @ObservedObject var vm :StudentViewModel
    @FocusState private var keyboardIsFocused: Bool
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
                .opacity(0.4)
                .onTapGesture {
                    vm.isPresentAddStudents.toggle()
                }
            VStack(alignment: .leading) {
                Text("Name student:")
                    .foregroundStyle(.white)
                    .font(.system(size: 24, weight: .bold))
                TextField("Name", text: $vm.simpleName)
                    .focused($keyboardIsFocused)
                    .foregroundColor(.white)
                    .padding(10)
                    .background {
                        Color.gray.opacity(0.5).cornerRadius(5)
                    }
                
                HStack {
                    Spacer()
                    Button {
                        vm.addStudent()
                        vm.isPresentAddStudents.toggle()
                    } label: {
                        CustonButtonView(text: "Save",height: 50)
                            .frame(width: 150)
                    }

                    
                    Spacer()
                }
            }
            .padding()
            .background {
                Color.second.cornerRadius(20)
        }
            .padding()
        }
        .onTapGesture {
            keyboardIsFocused.toggle()
        }
    }
}

#Preview {
    AddStudentView(vm: StudentViewModel())
}
