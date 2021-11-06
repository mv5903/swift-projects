//
//  Help.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 11/2/21.
//

import SwiftUI

struct Help: View {
    
    @State private var showAlert: Bool = false;
    var body: some View {
        Image(systemName: "questionmark.circle").resizable().scaledToFill().frame(width: 25, height: 25)
            .onTapGesture {
                self.showAlert =true
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("How to Use this App"),
                    message: Text("Tap a score to change it.\nDouble-tap to undo last score change.\nLong press score to reset it.")
                )
            }
    }
}
