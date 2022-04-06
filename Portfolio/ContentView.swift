//
//  ContentView.swift
//  Portfolio
//
//  Created by John Varney on 4/2/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       TabView {
          HomeView()
             .tabItem {
                Image(systemName: "house")
                Text("Home")
             }
          
          ProjectsView(showClosedProjects: true)
             .tabItem {
                Image(systemName: "checkmark")
                Text("Closed")
             }
          
          ProjectsView(showClosedProjects: false)
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
