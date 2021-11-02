//
//  Dummy_ScoreboardApp.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/28/21.
//

import SwiftUI

@main // entry point to app, first view that user sees
struct Dummy_ScoreboardApp: App {
    @AppStorage("Show Intro Alert") var showIntroAlert: Bool = true;
    @State var introShows: Bool = true;
    var body: some Scene {
        WindowGroup {
            ContentView().alert(isPresented: $introShows) {
                Alert(title: Text("Instructions"), message: Text("Tap on a score to change it. Top and hold to reset the score."), dismissButton: .default(Text("Got it!")))
            }
        }
    }
}
