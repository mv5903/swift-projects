//
//  Options.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct Options: View {
    @AppStorage("teamInfo.topTeam.name") var topTeamName: String = "Top Team";
    @AppStorage("teamInfo.topTeam.score") var topTeamScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "Bottom Team";
    @AppStorage("teamInfo.bottomTeam.score") var bottomTeamScore: Int = 0;
    @AppStorage("deviceInfo.showTeamNames") var showTeamNames: Bool = true;
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.resetScoreTo") var reset: Int = 0;
    
    @AppStorage("optionsArePresented") var optionsPresented: Bool = false;
    
    var body: some View {
        ZStack () {
            NavigationView {
                // Outer most form, first form user sees when tapping the gear icon
                Form {
                    // Edit Team Information
                    NavigationLink("Edit Team Info", destination: {
                        Form {
                            NavigationLink("Top Team", destination: EditTeam(isTopTeam: true));
                            NavigationLink("Bottom Team", destination: EditTeam(isTopTeam: false));
                        }.navigationBarTitle(Text("Teams"));
                    });
                    // Edit Scoring Criteria
                    NavigationLink("Edit Scoring Criteria", destination: {
                        Form {
                            NavigationLink("Change Score By", destination: {
                                Form {
                                    TextField("Amount", value: $increment, formatter: NumberFormatter()).keyboardType(.numberPad);
                                }.navigationBarTitle(Text("Change Score By"))
                            });
                            NavigationLink("Reset Score To", destination: {
                                Form {
                                    TextField("Score", value: $reset, formatter: NumberFormatter()).keyboardType(.numberPad);
                                }.navigationBarTitle(Text("Reset Score To"))
                            });
                            Section(footer: Text("This won't affect the current score.")) {
                                Button("Reset Scoring Options To Default") {
                                    increment = 1;
                                    scoreIncreases = true;
                                    reset = 0;
                                }
                            }
                        }.navigationBarTitle(Text("Scoring Criteria"));
                    });
                    // Other Miscellaneous Options
                    Section(header: Text("Other Options"), footer: Text(scoreIncreases ? "Score will increase when tapping the score. Toggle off to decrease instead." : "Score will decrease when tapping the score. Toggle on to increase instead.")) {
                        Toggle("Show Team Names", isOn: $showTeamNames);
                        Toggle("Score Increases", isOn: $scoreIncreases);
                    }
                }.navigationBarTitle(Text("Options"))
            }
            GeometryReader { geo in
                Image(systemName: "xmark.circle").resizable().scaledToFill().frame(width: 25, height: 25)
                    .onTapGesture {
                        optionsPresented = false;
                    }.position(x: geo.size.width - 25, y: 25)
            }
        }
    }
}

struct EditTeam: View {
    @AppStorage("teamInfo.topTeam.name") var topTeamName: String = "Top Team";
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "Bottom Team";
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


