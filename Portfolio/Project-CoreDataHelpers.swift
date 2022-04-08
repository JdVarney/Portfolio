//
//  Project-CoreDataHelpers.swift
//  Portfolio
//
//  Created by John Varney on 4/6/22.
//

import Foundation

extension Project {
   
   var projectColor : String {
      color ?? "light Blue"
   }
   
   var projectTitle : String {
      title ?? "Project Title"
   }
   
   var projectDetail: String {
      detail ?? ""
   }
   
   static var example: Project {
      let controller = DataController(inMemory: true)
      let viewContext = controller.container.viewContext
      let project = Project(context: viewContext)
      project.title = "Example Project"
      project.creationDate = Date()
      project.color = "Light Green"
      project.detail = "Project Detail"
      return project
   }
   
   var projectItems: [Item] {
      let itemsArray = items?.allObjects as? [Item] ?? []
      
      return itemsArray.sorted { first, second in
         if first.completed == true {
            if second.completed == true {
               return true
            }
         } else {
            if first.completed == false {
               if second.completed == false {
                  return false
               }
            }
         }
         
         if first.priority > second.priority {
            return true
         } else {
            if first.priority < second.priority {
               return false
            }
         }
         
         return first.itemCreationDate < second.itemCreationDate
      }
   }
   
   var completionAmount: Double {
      let originalItems = items?.allObjects as? [Item] ?? []
      guard originalItems.isEmpty == false else { return 0 }
      
      let completedItems = originalItems.filter(\.completed)
      return Double(completedItems.count) / Double(originalItems.count)
   }
}
