//
//  StudentViewModel.swift
//  CoachMate
//
//  Created by Роман on 31.08.2024.
//

import Foundation
import CoreData

final class StudentViewModel:ObservableObject{
    let manager = CoreDataManager.instance
    
    @Published var students: [Student] = []
    
    @Published var simpleName = ""
    
    @Published var isPresentStudents = false
    
    init(){
        getStudents()
    }
    
    //MARK: - Edit data
    func payStudent(id: ObjectIdentifier){
        let request = NSFetchRequest<Student>(entityName: "Student")
        do {
            students = try manager.context.fetch(request)
            let student = students.first(where: {$0.id == id})
            student?.pay = true
        }catch let error{
            print("Error fetch Coredata: \(error.localizedDescription)")
        }
        save()
    }
    
    //MARK: - Delete data
    func deleteStudent(student: Student){
        manager.context.delete(student)
        save()
    }
    
    //MARK: - Add data
    func addStudent(){
        let newStudent = Student(context: manager.context)
        newStudent.name = simpleName
        save()
        simpleName = ""
    }
    
    //MARK: - Get Data
    private func getStudents(){
        let request = NSFetchRequest<Student>(entityName: "Student")
        do {
            students = try manager.context.fetch(request)
        }catch let error{
            print("Error fetch Coredata: \(error.localizedDescription)")
        }
    }
    
    //MARK: - Save data
    private func save(){
        students.removeAll()
        manager.save()
        getStudents()
    }
}
