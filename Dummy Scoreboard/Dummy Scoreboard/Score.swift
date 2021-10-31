//
//  Score.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI


struct Score: View {
    @State var score: Int = 0
    var body: some View {
        Text(String(score)).font(.system(size: CGFloat(64))).onTapGesture() {
            score = score + 1;
        }.onLongPressGesture(minimumDuration: 2) {
            score = 0;
        }
    }
}
