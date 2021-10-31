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
    var score = Score(score: 0);
    var topTeam: Bool;
    var body: some View {
        if (!topTeam) { score }
        VStack(alignment: .center) {
            TextField("", text: $displayText)
                .font(.system(size: CGFloat(32)))
        }
        if (topTeam) { score }
    }
}

