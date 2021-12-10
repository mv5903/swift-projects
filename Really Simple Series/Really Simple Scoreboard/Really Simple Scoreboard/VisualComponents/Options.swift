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
    @AppStorage("teamInfo.topTeam.fontColor") var topTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "Bottom Team";
    @AppStorage("teamInfo.bottomTeam.score") var bottomTeamScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.fontColor") var bottomTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("deviceInfo.showTeamNames") var showTeamNames: Bool = true;
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.resetScoreTo") var reset: Int = 0;
    @AppStorage("scoreInfo.fontSize") var scoreSize: Int = 90;
    
    @AppStorage("optionsArePresented") var optionsPresented: Bool = false;
    
    var body: some View {
        ZStack () {
            NavigationView {
                // Outer most form, first form user sees when tapping the gear icon
                Form {
                    // Edit Team Information
                    NavigationLink("Team Options", destination: {
                        Form {
                            NavigationLink(orientation == "Portrait" ? "Top Team" : "Left Team", destination: EditTeam(isTopTeam: true));
                            NavigationLink(orientation == "Portrait" ? "Bottom Team" : "Right Team", destination: EditTeam(isTopTeam: false));
                        }.navigationBarTitle(Text("Teams"));
                    });
                    // Edit Scoring Criteria
                    NavigationLink("Score Options", destination: {
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
                            NavigationLink("Score Font Size", destination: {
                                Form {
                                    Stepper("Size: \(scoreSize)", value: $scoreSize, in: 80...280, step: 10);
                                }.navigationBarTitle(Text("Score Font Size"));
                                Text("Preview: ");
                                Text("0").font(.custom("San-Francisco", size: CGFloat(scoreSize)))
                            });
                            Section(footer: Text("This won't affect the current score.")) {
                                Button("Reset Scoring Options To Default") {
                                    increment = 1;
                                    scoreIncreases = true;
                                    reset = 0;
                                    scoreSize = 90;
                                }
                            }
                        }.navigationBarTitle(Text("Scoring Options"));
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
    @AppStorage("teamInfo.topTeam.fontColor") var topTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.topTeam.scoreColor") var topScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "Bottom Team";
    @AppStorage("teamInfo.bottomTeam.fontColor") var bottomTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.scoreColor") var bottomScoreColor: String = Data.colorToString(color: Color.white);
    @State var isTopTeam: Bool = true;
    @State var selectedFontColor: Color = Color.white;
    @State var selectedScoreColor: Color = Color.white;
    var body: some View {
        Form {
            // Edit Team Name
            NavigationLink("Edit Team Name", destination: {
                Form {
                    TextField(getTeam() + " Team Name", text: isTopTeam ? $topTeamName : $bottomTeamName)
                }.submitLabel(.done).navigationBarTitle(Text(getTeam() + " Team Name"));
            })
            NavigationLink("Edit Team Color", destination: {
                Form {}.navigationBarTitle(Text((getTeam() + " ") + "Team Color"))
                ColorPicker("Color", selection: $selectedFontColor)
                    .padding(.horizontal, 150)
                    .onChange(of: selectedFontColor) { _ in convertColor(toChange: "selectedFontColor") }
            })
            NavigationLink("Edit Score Color", destination: {
                Form {}.navigationBarTitle(Text((getTeam() + " ") + "Score Color"))
                ColorPicker("Color", selection: $selectedScoreColor)
                    .padding(.horizontal, 150)
                    .onChange(of: selectedScoreColor) { _ in convertColor(toChange: "selectedScoreColor") };
            })
        }.navigationBarTitle(Text("Team Options"));
    }
    
    func getTeam() -> String {
        if (isTopTeam) {
            return orientation == "Portrait" ? "Top" : "Left";
        } else {
            return orientation == "Portrait" ? "Bottom" : "Right";
        }
    }
    
    func convertColor(toChange: String) -> Void {
        if (toChange == "selectedFontColor") {
            if (isTopTeam) {
                topTeamColor = Data.colorToString(color: selectedFontColor);
            } else {
                bottomTeamColor = Data.colorToString(color: selectedFontColor);
            }
        } else {
            if (isTopTeam) {
                topScoreColor = Data.colorToString(color: selectedScoreColor);
            } else {
                bottomScoreColor = Data.colorToString(color: selectedScoreColor);
            }
        }
    }
}


