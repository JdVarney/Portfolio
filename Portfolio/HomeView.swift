//
//  HomeView.swift
//  Portfolio
//
//  Created by John Varney on 4/5/22.
//

import SwiftUI

struct HomeView: View {
   @EnvironmentObject var dataController: DataController
   
   var body: some View {
      NavigationView {
         VStack {
            Button("Add Data") {
               dataController.deleteAll()
               try? dataController.createSampleData()
            }
         }
         .navigationTitle("Home")
      }
   }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
