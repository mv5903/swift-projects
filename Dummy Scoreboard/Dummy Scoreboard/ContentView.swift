//
//  ContentView.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/28/21.
//


//Default view that the user sees. Used from main.
import SwiftUI

struct ContentView: View {
    var teamLeft = Team(colorText: Color.white, size: 24, isTopTeam: true)
    var teamRight = Team(colorText: Color.yellow, size: 24, isTopTeam: false)
    var gear = Gear();
    var body: some View {
        Group {
            GeometryReader { g in
                if g.size.width < g.size.height {
                    GeometryReader { geo in
                        let height = geo.size.height;
                        let width = geo.size.width;
                        ZStack() {
                            VStack(alignment: .center, spacing: 50) {
                                teamLeft
                                CenterDivider(direction: "Horizontal")
                                teamRight
                            }.padding(.vertical, 20);
                            gear.position(x: width - 15, y: height/2 - 30);
                        }
                    }
                } else  {
                    GeometryReader { geo in
                        ZStack() {
                            HStack(alignment: .center) {
                                teamLeft
                                CenterDivider(direction: "Vertical")
                                teamRight
                            }
                            gear.position(x: 25, y: 25);
                        }
                    }
                }
            }
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
