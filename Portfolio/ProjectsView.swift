//
//  ProjectsView.swift
//  Portfolio
//
//  Created by John Varney on 4/4/22.
//

import SwiftUI

struct ProjectsView: View {
   
   let showClosedProjects: Bool
   let projects: FetchRequest<Project>
   
   static let openTag: String? = "Open"
   static let closedTag: String? = "Closed"
   
   init(showClosedProjects: Bool) {
      self.showClosedProjects = showClosedProjects
      
      projects = FetchRequest<Project>(entity: Project.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \Project.creationDate, ascending: false)],
               predicate: NSPredicate(format: "closed = %d", showClosedProjects))
   }

   var body: some View {
      NavigationView {
         List {
            ForEach(projects.wrappedValue) { project in
               Section(header: Text(project.projectTitle)) {
                  ForEach(project.projectItems) { item in
                     ItemRowView(item: item)
                     }
                  }
               }
            }
            .navigationTitle(showClosedProjects ? "Closed" : "Open")
            .listStyle(InsetGroupedListStyle())
         }
      }
   }


struct ProjectsView_Previews: PreviewProvider {
   static var dataController = DataController.preview
   static var previews: some View {
      ProjectsView(showClosedProjects: false)
         .environment(\.managedObjectContext, dataController.container.viewContext)
         .environmentObject(dataController)
   }
}
