//
//  Team.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI

struct Team: View {
    @State var displayText: String;
    @State var colorText: Color;
    var size: Int;
    var topTeam: Bool;
    @State var score = Score(score: 0);
    var body: some View {
        !topTeam ? score : nil;
        TextField("", text: $displayText)
            .font(.system(size: CGFloat(32))).multilineTextAlignment(.center)
        if (topTeam) {
            score
        }
    }
}

