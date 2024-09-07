//
//  TrainingViewModel.swift
//  CoachMate
//
//  Created by Роман on 07.09.2024.
//

import Foundation
import CoreData

final class TrainingViewModel: ObservableObject{
    
    let manager = CoreDataManager.instance
    
    @Published var trainings: [Training] = []
    @Published var simpleTraining: Training!
    
    @Published var simpletextTraining = ""
    
    @Published var isPresentAddTraining = false
    @Published var isPresentTrainings = false
    
    init(){
        getTrainings()
    }
    
    //MARK: - Edit data
    func editTraining(){
        let request = NSFetchRequest<Training>(entityName: "Training")
        
        do{
            trainings = try manager.context.fetch(request)
            let training = trainings.first(where: {$0.id == simpleTraining.id})
            training?.text = simpletextTraining
        }catch let error {
            print("Feth training error: \(error.localizedDescription)")
        }
        save()
        isPresentAddTraining = false
        simpletextTraining = ""
    }
    
    //MARK: - Add training
    func addTraining(){
        let newTraining = Training(context: manager.context)
        newTraining.date = Date()
        newTraining.text = simpletextTraining
        save()
        simpletextTraining = ""
        isPresentAddTraining = false
    }
    
    //MARK: - Get data
    func getTrainings(){
        let request = NSFetchRequest<Training>(entityName: "Training")
        
        do{
            trainings = try manager.context.fetch(request)
        }catch let error {
            print("Feth training error: \(error.localizedDescription)")
        }
    }
        
    //MARK: - Save data
    func save(){
        trainings.removeAll()
        manager.save()
        getTrainings()
    }
}

