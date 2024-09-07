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
    @Published var salarys: [Salary] = []
    
    @Published var simpleName = ""
    
    @Published var isPresentStudents = false
    @Published var isPresentAddStudents = false
    
    init(){
        getStudents()
        getSalary()
    }
    
    //MARK: Sorted student
    func getPaid() -> Int{
        var countPaid = 0
        for student in students {
            if student.pay{
                countPaid += 1
            }
        }
        return countPaid
    }
    func getDontPay() -> Int{
        var countDontPay = 0
        for student in students {
            if !student.pay{
                countDontPay += 1
            }
        }
        return countDontPay
    }
    
    //MARK: - Dateformatter
             func Dateformatter(date: Date) -> String{
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "MMMM"
                return dateFormatter.string(from: date)
            }
    
    //MARK: - Sortes Salary
    func getSalaryMouth() -> Int16{
        
        let nowMouth = Dateformatter(date: Date())
        var totalSalary:Int16 = 0
        
        for salary in salarys {
            if nowMouth == Dateformatter(date: salary.date ?? Date()){
                totalSalary += salary.play
            }
            
        }
        return totalSalary
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
    
    func addSalary(){
        let newSalary = Salary(context: manager.context)
        newSalary.play = 500
        newSalary.date = Date()
        saveSalary()
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
    
    private func getSalary(){
        let request = NSFetchRequest<Salary>(entityName: "Salary")
        do {
            salarys = try manager.context.fetch(request)
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
    private func saveSalary(){
        salarys.removeAll()
        manager.save()
        getSalary()
    }
}
