//
//  Options.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct Options: View {
    @AppStorage("increment") var increment: Int = 1;
    @AppStorage("scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("resetScore") var resetScore: Int = 0;
    @AppStorage("isPresented") var isPresented: Bool = false;
    var body: some View {
        ZStack () {
            NavigationView {
                Form {
                    // Edit Team Information
                    NavigationLink("Edit Team Info", destination: {
                        Form {
                            NavigationLink("Top Team", destination: EditTeam(isTopTeam: true));
                            NavigationLink("Bottom Team", destination: EditTeam(isTopTeam: false));
                        }.navigationBarTitle(Text("Teams"));
                    });
                    // Edit Scoring Criterea
                    NavigationLink("Edit Scoring Criteria", destination: {});
                    Section(header: Text("Change Score By")) {
                        TextField("Amount", value: $increment, formatter: NumberFormatter()).keyboardType(.numberPad);
                    }
                    Section(header: Text("Reset Score To")) {
                        TextField("Score", value: $resetScore, formatter: NumberFormatter()).keyboardType(.numberPad);
                    }
                    Section(header: Text("Other Options"), footer: Text(scoreIncreases ? "Score will increase when tapping the score. Toggle off to decrease instead." : "Score will decrease when tapping the score. Toggle on to increase instead.")) {
                        Toggle("Score Increases", isOn: $scoreIncreases);
                    }
                    Button("Reset To Default") {
                        increment = 1;
                        scoreIncreases = true;
                        resetScore = 0;
                    }
                }.navigationBarTitle(Text("Options"))
            }
            GeometryReader { geo in
                Image(systemName: "xmark.circle").resizable().scaledToFill().frame(width: 25, height: 25)
                    .onTapGesture {
                        isPresented = false;
                    }.position(x: geo.size.width - 25, y: 25)
            }
        }
    }
}

struct EditTeam: View {
    @AppStorage("topTeamName") var topTeamName: String = "Top Team";
    @AppStorage("bottomTeamName") var bottomTeamName: String = "Bottom Team";
    @State var isTopTeam: Bool = true;
    var body: some View {
        Form {
            // Edit Team Name
            NavigationLink("Edit Team Name", destination: {
                Form {
                    TextField(isTopTeam ? "Top Team Name" : "Bottom Team Name", text: isTopTeam ? $topTeamName : $bottomTeamName)
                }.submitLabel(.done).navigationBarTitle(Text(isTopTeam ? "Top Team Name" : "Bottom Team Name"));
            })
        }.navigationBarTitle(Text("Team Options"));
    }
}


