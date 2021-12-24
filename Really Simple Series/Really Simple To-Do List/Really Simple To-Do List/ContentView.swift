//
//  ContentView.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    @StateObject var listManager = ListManager()
    var body: some View {
        Text("Tasks")
        TaskList(listManager: listManager)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
