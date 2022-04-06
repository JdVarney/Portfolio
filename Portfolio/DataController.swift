//
//  DataController.swift
//  Portfolio
//
//  Created by John Varney on 4/3/22.
//

import SwiftUI
import CoreData

class DataController: ObservableObject {
   
   let container: NSPersistentContainer
   
   init(inMemory:Bool = false) {
      container = NSPersistentContainer(name: "Main")
      
      if inMemory {
         container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
      }
      
      container.loadPersistentStores(completionHandler: { storeDescription, error in
         if let error = error {
            fatalError("Unable to load store. \(error.localizedDescription)")
         }
      })
   }
   
   static var preview: DataController = {
      let dataController = DataController(inMemory: true)
      let viewContext = dataController.container.viewContext
      
      do {
         try dataController.createSampleData()
      } catch {
         fatalError("Fatal error creating preview \(error.localizedDescription)")
      }
      
      return dataController
   }()
   
   func createSampleData() throws {
      let viewContext = container.viewContext
      
      for i in 1...5 {
         let project = Project(context: viewContext)
         project.title = "Project \(i)"
         project.items = []
         project.closed = Bool.random()
         project.completionDate = Date()
         
         for j in 1...10 {
            let item = Item(context: viewContext)
            item.title = "Item \(j)"
            item.project = project
            item.completed = Bool.random()
            item.creationDate = Date()
            item.priority = Int16.random(in: 1...3)
            
         }
      }
      try viewContext.save()
   }
   
   
   func save() {
      if container.viewContext.hasChanges {
         try? container.viewContext.save()
      }
   }
   
   func delete(_ object: NSManagedObject) {
      container.viewContext.delete(object)
   }
   
   func deleteAll() {
      let fetchReques1: NSFetchRequest<NSFetchRequestResult> = Item.fetchRequest()
      let batchDeleteRequest1 = NSBatchDeleteRequest(fetchRequest: fetchReques1)
      _ = try? container.viewContext.execute(batchDeleteRequest1)
      
      let fetchRequest2: NSFetchRequest<NSFetchRequestResult> = Project.fetchRequest()
      let batchDeleteRequest2 = NSBatchDeleteRequest(fetchRequest: fetchRequest2)
      _ = try? container.viewContext.execute(batchDeleteRequest2)
      
   }
}
