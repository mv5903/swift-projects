//
//  Team.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI

struct Team: View {
    @AppStorage("topTeamName") var topTeamName: String = "Top Team";
    @AppStorage("bottomTeamName") var bottomTeamName: String = "Bottom Team";
    @AppStorage("orientation") var orientated: String = "Portrait";
    @AppStorage("showTeamNames") var showTeamNames: Bool = true;
    @State var colorText: Color;
    var size: Int;
    var isTopTeam: Bool;
    @State var score = Score(score: 0);
    var body: some View {
        if orientated == "Portrait" {
            !isTopTeam ? score : nil;
            showTeamNames ? TextField("", text: isTopTeam ? $topTeamName : $bottomTeamName)
                .font(.system(size: CGFloat(46))).multilineTextAlignment(.center) : nil;
            if (isTopTeam) {
                score
            }
        } else {
            VStack(alignment: .center, spacing: 50) {
                TextField("", text: isTopTeam ? $topTeamName : $bottomTeamName)
                    .font(.system(size: CGFloat(46))).multilineTextAlignment(.center)
                score
            }
        }
    }
}

