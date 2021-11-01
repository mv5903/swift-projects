//
//  Team.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI

struct Team: View {
    @AppStorage("orientation") var orientated: String = "Portrait";
    @State var displayText: String;
    @State var colorText: Color;
    var size: Int;
    var topTeam: Bool;
    @State var score = Score(score: 0);
    var body: some View {
        if orientated == "Portrait" {
            !topTeam ? score : nil;
            TextField("", text: $displayText)
                .font(.system(size: CGFloat(36))).multilineTextAlignment(.center)
            if (topTeam) {
                score
            }
        } else {
            VStack(alignment: .center, spacing: 50) {
                TextField("", text: $displayText)
                    .font(.system(size: CGFloat(46))).multilineTextAlignment(.center)
                score
            }
        }
    }
}

