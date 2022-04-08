//
//  ContentView.swift
//  Portfolio
//
//  Created by John Varney on 4/2/22.
//

import SwiftUI

struct ContentView: View {
   
   @SceneStorage("selectedView") var selectedView: String?
   
    var body: some View {
       TabView(selection: $selectedView) {
          HomeView()
             .tag(HomeView.tag)
             .tabItem {
                Image(systemName: "house")
                Text("Home")
             }
          
          ProjectsView(showClosedProjects: true)
             .tag(ProjectsView.closedTag)
             .tabItem {
                Image(systemName: "checkmark")
                Text("Closed")
             }
          
          ProjectsView(showClosedProjects: false)
             .tag(ProjectsView.openTag)
             .tabItem {
                Image(systemName: "list.bullet")
                Text("Open")
             }
       }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
