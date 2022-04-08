//
//  EditItemView.swift
//  Portfolio
//
//  Created by John Varney on 4/7/22.
//

import SwiftUI

struct EditItemView: View {
   
   let item: Item
   @EnvironmentObject var dataController: DataController
   
   @State private var title: String
   @State private var completed: Bool
   @State private var priority: Int
   @State private var detail: String
   
   init(item: Item) {
      self.item = item
      _title = State(wrappedValue: item.itemTitle)
      _completed = State(wrappedValue: item.completed)
      _priority = State(wrappedValue: Int(item.priority))
      _detail = State(wrappedValue: item.itemDetail)
   }
   
   func update() {
      item.project?.objectWillChange.send()
      item.title = title
      item.completed = completed
      item.detail = detail
      item.priority = Int16(priority)
   }
   
    var body: some View {
       Form {
          Section(header: Text("Basic Settings")) {
             TextField("Item Name", text: $title)
             TextField("Description", text: $detail)
          }
          Section(header: Text("Priority")) {
             Picker("Priority", selection: $priority) {
                Text("Low").tag(1)
                Text("Medium").tag(2)
                Text("High").tag(3)
             }
             .pickerStyle(SegmentedPickerStyle())
          }
          Section {
             Toggle("Mark Completed:", isOn: $completed)
          }
       }
       .navigationTitle("Edit Item")
       .onDisappear(perform: update)
    }
}

struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
       EditItemView(item: Item.example)
    }
}
