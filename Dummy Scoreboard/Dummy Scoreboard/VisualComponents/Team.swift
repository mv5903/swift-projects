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
    @State var colorText: Color;
    var size: Int;
    var isTopTeam: Bool;
    @State var score = Score(score: 0);
    var body: some View {
        if orientated == "Portrait" {
            !isTopTeam ? score : nil;
            TextField("", text: isTopTeam ? $topTeamName : $bottomTeamName)
                .font(Constants.getAppFont(size: CGFloat(36))).multilineTextAlignment(.center)
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

