//
//  Score.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI


struct Score: View {
 
    @State var isTop: Bool = true;
    
    var body: some View {
        Text(String(score)).font(.system(size: CGFloat(96))).onTapGesture(count: 2) {
            undoScore();
        }.onTapGesture(count: 1) {
            score = scoreIncreases ? score + increment : score - increment;
        }.onLongPressGesture(minimumDuration: 1) {
            score = resetScore;
        }
    }
    func undoScore() -> Void {
        score = scoreIncreases ? score - increment : score + increment;
    }
}



