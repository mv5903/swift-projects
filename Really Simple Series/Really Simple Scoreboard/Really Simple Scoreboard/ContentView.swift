//
//  ContentView.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/28/21.
//


//Default view that the user sees. Used from main.
import SwiftUI

struct ContentView: View {
    var topTeam = Team(isTop: true)
    var bottomTeam = Team(isTop: false);
    @AppStorage("deviceInfo.orientation") var devOrientation: String = "Portrait";
    var body: some View {
        Group {
            GeometryReader { g in
                // Define height and width of current view
                let height = g.size.height;
                let width = g.size.width;
                // View is in Portrait
                if width < height {
                    ZStack() {
                        VStack(alignment: .center, spacing: 50) {
                            topTeam
                            CenterDivider(direction: "Horizontal")
                            bottomTeam
                        }.padding(.vertical, 20);
                        Help().position(x: 15, y: height/2 - 30);
                        Gear().position(x: width - 15, y: height/2 - 30);
                    }.onAppear{changeOrientation(orientation: "Portrait")}
                // View is in Lanscape
                } else  {
                    ZStack() {
                        HStack(alignment: .center) {
                            topTeam
                            CenterDivider(direction: "Vertical")
                            bottomTeam
                        }
                        Gear().position(x: 25, y: 25);
                        Help().position(x: width - 25, y: 25);
                    }.onAppear{changeOrientation(orientation: "Landscape")}
                }
            }
        }
    }
    
    func changeOrientation(orientation: String) -> Void {
        devOrientation = orientation;
    }
}




struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
