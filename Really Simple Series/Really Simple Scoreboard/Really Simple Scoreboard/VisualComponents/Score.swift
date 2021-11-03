//
//  Score.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI


struct Score: View {
    @AppStorage("increment") var increment: Int = 1;
    @AppStorage("scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("resetScore") var resetScore: Int = 0;
    @State var score: Int = 0;
    var body: some View {
        Text(String(score)).font(.system(size: CGFloat(96))).onTapGesture() {
            if (scoreIncreases) {
                score = score + increment;
            } else {
                score = score - increment;
            }
        }.onLongPressGesture(minimumDuration: 1) {
            score = resetScore;
        }
    }
}
