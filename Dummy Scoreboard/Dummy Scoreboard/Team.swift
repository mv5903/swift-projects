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
        if (!topTeam) {
            score
        }
        TextField("", text: $displayText)
            .font(.system(size: CGFloat(32))).multilineTextAlignment(.center)
        if (topTeam) {
            score
            GeometryReader { geo in
                let height = geo.size.height;
                let width = geo.size.width;
                let thickness = 2;
                Path() { path in
                    path.move(to: CGPoint(x: 0, y: (Int)(height/2) + thickness));
                    path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) + thickness)));
                    path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) - thickness)));
                    path.addLine(to: CGPoint(x: 0, y: (Int)(height/2) - thickness));
                }.fill(Color.white);
            }
        }
    }
}

