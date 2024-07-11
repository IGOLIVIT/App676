//
//  HomeViewModel.swift
//  App676
//
//  Created by IGOR on 08/07/2024.
//

import SwiftUI
import CoreData

final class HomeViewModel: ObservableObject {
    
    @AppStorage("prPhoto") var prPhoto: String = ""
    @AppStorage("name") var name: String = ""

    @Published var curPhoto = ""
    @Published var addedName = ""
    
    @Published var photos: [String] = ["boy", "girl"]
    
    @AppStorage("status") var status: Bool = false
    
    @AppStorage("categories") var categories: [String] = []
    @Published var selectedCategory = ""
    
    @AppStorage("today") var today: Int = 0
    @AppStorage("month") var month: Int = 0
    @AppStorage("AllTime") var AllTime: Int = 0
    
    @Published var todayAdd = ""
    @Published var monthAdd = ""
    @Published var allAdd = ""

    @Published var isAdd: Bool = false
    @Published var isDelete: Bool = false
    @Published var isDetail: Bool = false
    @Published var isExpenses: Bool = false
    @Published var isAddCons: Bool = false
    @Published var isProfile: Bool = false
    
    @Published var colors: [String] = ["red", "green", "purple", "gray"]
    @Published var currentCoor = ""
    
    @Published var icons: [String] = ["house.fill", "star.fill", "chair.lounge.fill", "refrigerator.fill", "shower.fill", "bed.double.fill"]
    @Published var currenticon = ""

    @Published var prName = ""
    @Published var prIcon = ""
    @Published var prColor = ""
    
    @Published var projects: [ProjModel] = []
    @Published var selectedProject: ProjModel?

    func addProject() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ProjModel", into: context) as! ProjModel

        loan.prName = prName
        loan.prIcon = prIcon
        loan.prColor = prColor

        CoreDataStack.shared.saveContext()
    }

    func fetchProjects() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ProjModel>(entityName: "ProjModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.projects = result

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.projects = []
        }
    }
    
    @Published var consProject = ""
    @Published var consSum = ""
    @Published var consDate = ""
    @Published var consCategory = ""
    @Published var consComment = ""
    
    @Published var cons: [ConsModel] = []
    @Published var selectedCons: ConsModel?

    func addCons() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "ConsModel", into: context) as! ConsModel

        loan.consProject = consProject
        loan.consSum = consSum
        loan.consDate = consDate
        loan.consCategory = consCategory
        loan.consComment = consComment

        CoreDataStack.shared.saveContext()
    }

    func fetchCons() {

        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<ConsModel>(entityName: "ConsModel")

        do {

            let result = try context.fetch(fetchRequest)

            self.cons = result.filter{($0.consProject ?? "") == selectedProject?.prName}

        } catch let error as NSError {

            print("catch")

            print("Error fetching persons: \(error), \(error.userInfo)")

            self.cons = []
        }
    }
}
