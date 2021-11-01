//
//  ContentView.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/28/21.
//


//Default view that the user sees. Used from main.
import SwiftUI

struct ContentView: View {
    @AppStorage("orientation") var orientated: String = "Portrait";
    
    @State var orientation = UIDevice.current.orientation

    let orientationChanged = NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
        .makeConnectable()
        .autoconnect()
    var teamLeft = Team(displayText: "Left Team", colorText: Color.white, size: 24, topTeam: true)
    var teamRight = Team(displayText: "Right Team", colorText: Color.yellow, size: 24, topTeam: false)
    var gear = Gear();
    var body: some View {
        Group {
            if orientation.isPortrait {
                GeometryReader { geo in
                    let height = geo.size.height;
                    let width = geo.size.width;
                    ZStack() {
                        VStack(alignment: .center, spacing: 50) {
                            teamLeft
                            CenterDivider()
                            teamRight
                        }.padding(.vertical, 20);
                        gear.position(x: width - 15, y: height/2 - 30);
                    }
                }
            } else if orientation.isLandscape {
                GeometryReader { geo in
                    ZStack() {
                        HStack(alignment: .center) {
                            teamLeft
                            CenterDivider()
                            teamRight
                        }
                        gear.position(x: 25, y: 25);
                    }
                }
            }
        }
        .onReceive(orientationChanged) { _ in
            orientated = UIDevice.current.orientation.isPortrait ? "Portrait" : "Landscape"
            self.orientation = UIDevice.current.orientation
        }
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
