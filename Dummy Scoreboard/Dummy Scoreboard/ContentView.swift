//
//  ContentView.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/28/21.
//


//Default view that the user sees. Used from main.
import SwiftUI

struct ContentView: View {
    var teamLeft = Team(displayText: "Left Team", colorText: Color.white, size: 24, topTeam: true)
    
    var teamRight = Team(displayText: "Right Team", colorText: Color.yellow, size: 24, topTeam: false)
    
    var gear = Gear();
    
    var body: some View {
        VStack(alignment: .center, spacing: 50) {
            gear
            teamLeft
            CenterDivider().onLongPressGesture(minimumDuration: 2) {
                //todo reset scores
            }
            teamRight
        }.padding(.vertical, 30);
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
