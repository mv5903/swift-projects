//
//  ContentView.swift
//  Batterama
//
//  Created by Matthew Vandenberg on 11/22/21.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("isLoggedIn") var isLoggedIn: Bool = false;
    var body: some View {
        //if (!isLoggedIn) {
            FirstLaunch();
        //}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
