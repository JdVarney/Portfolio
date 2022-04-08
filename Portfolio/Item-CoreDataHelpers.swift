//
//  Item-CoreDataHelpers.swift
//  Portfolio
//
//  Created by John Varney on 4/6/22.
//

import Foundation

extension Item {
   
   var itemCreationDate: Date {
      creationDate ?? Date()
   }
   
   var itemDetail: String {
      detail ?? ""
   }
   
   var itemTitle: String {
      title ?? ""
   }
   
   static var example: Item {
      let controller = DataController(inMemory: true)
      let viewContext = controller.container.viewContext
      
      let item = Item(context: viewContext)
      item.priority = 2
      item.detail = "Reporting some thing"
      item.completed = false
      item.title = "Task title here"
      item.creationDate = Date()
      return item
   }
}
