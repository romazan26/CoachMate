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
    @Published var mouthSalary: [MouthSalary] = []
    
    @Published var simpleName = ""
    
    @Published var isPresentStudents = false
    @Published var isPresentAddStudents = false
    
    init(){
        getStudents()
        getSalary()
        getMouthSalary()
        if mouthSalary.isEmpty {
            addMouth(mouth: "January")
            addMouth(mouth: "February")
            addMouth(mouth: "March")
            addMouth(mouth: "April")
            addMouth(mouth: "May")
            addMouth(mouth: "June")
            addMouth(mouth: "July")
            addMouth(mouth: "August")
            addMouth(mouth: "September")
            addMouth(mouth: "October")
            addMouth(mouth: "November")
            addMouth(mouth: "December")
            getSalaryMouthAll()
        }
        
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
    func getSalaryMouthNow() -> Int16{
        
        let nowMouth = Dateformatter(date: Date())
        var totalSalary:Int16 = 0
        
        for salary in salarys {
            if nowMouth == Dateformatter(date: salary.date ?? Date()){
                totalSalary += salary.play
            }
            
        }
        return totalSalary
    }
    
    func getSalaryMouthAll(){
        
        for salary in salarys {
            for mouth in mouthSalary {
                if Dateformatter(date: salary.date ?? Date()) == mouth.mouth{
                    editMouthSalary(mouth: mouth.mouth ?? "")
                }
            }
            
        }
        print(mouthSalary)

    }
    //MARK: - Edit data
    func payStudent(id: ObjectIdentifier){
        let request = NSFetchRequest<Student>(entityName: "Student")
        do {
            students = try manager.context.fetch(request)
            let student = students.first(where: {$0.id == id})
            student?.pay = true
            editMouthSalary(mouth: Dateformatter(date: Date()))
        }catch let error{
            print("Error fetch Coredata: \(error.localizedDescription)")
        }
        save()
        for mouth in mouthSalary {
            if mouth.count != 0{
                print(mouth)
            }
        }
        
    }
    func editMouthSalary(mouth: String){
        let request = NSFetchRequest<MouthSalary>(entityName: "MouthSalary")
        do {
            mouthSalary = try manager.context.fetch(request)
            let mouthEdit = mouthSalary.first(where: {$0.mouth == mouth})
            mouthEdit?.count += 1
            mouthEdit?.salary += 500
        }catch let error{
            print("Error fetch Coredata: \(error.localizedDescription)")
        }
        saveMouth()
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
    
    func addMouth(mouth: String){
        let newMouth = MouthSalary(context: manager.context)
        newMouth.mouth = mouth
        save()
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
    
    private func getMouthSalary(){
        let request = NSFetchRequest<MouthSalary>(entityName: "MouthSalary")
        do {
            mouthSalary = try manager.context.fetch(request)
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
    
    private func saveMouth(){
        mouthSalary.removeAll()
        manager.save()
        getMouthSalary()
    }
}
