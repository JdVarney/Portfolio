//
//  PortfolioApp.swift
//  Portfolio
//
//  Created by John Varney on 4/2/22.
//

import SwiftUI

@main
struct PortfolioApp: App {
   
   @StateObject var dataController: DataController
   
   init() {
      let dataController = DataController()
      _dataController = StateObject(wrappedValue: dataController)
   }
    var body: some Scene {
        WindowGroup {
            ContentView()
               .environment(\.managedObjectContext, dataController.container.viewContext)
               .environmentObject(dataController)
        }
    }
}
