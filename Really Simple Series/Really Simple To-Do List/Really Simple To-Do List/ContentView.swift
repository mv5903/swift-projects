//
//  ContentView.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/10/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text(Test.getText()).padding().foregroundColor(Color.black)
        TaskList()
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
