//
//  Team.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/29/21.
//
import SwiftUI

struct Team: View {
    @AppStorage("teamInfo.topTeam.name") var topName: String = "Top Team";
    @AppStorage("teamInfo.bottomTeam.name") var bottomName: String = "Bottom Team";
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("deviceInfo.showTeamNames") var showTeamNames: Bool = true;
    @AppStorage("teamInfo.topTeam.fontColor") var topColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.fontColor") var bottomColor: String = Data.colorToString(color: Color.white);
    
    @State var isTop: Bool = true;
    var body: some View {
        
        if orientation == "Portrait" {
            !isTop ? Score(isTopTeam: false) : nil;
            
            if (showTeamNames) {
                Text(isTop ? topName : bottomName).font(.system(size: CGFloat(46))).foregroundColor(isTop ? Data.stringToColor(color: topColor) : Data.stringToColor(color: bottomColor));
            }

            isTop ? Score(isTopTeam: true) : nil;
        } else {
            VStack(alignment: .center, spacing: 50) {
                Text(isTop ? topName : bottomName).font(.system(size: CGFloat(46))).foregroundColor(isTop ? Data.stringToColor(color: topColor) : Data.stringToColor(color: bottomColor));
                Score(isTopTeam: isTop);
            }
        }
    }
}

struct Score: View {
    @State var isTopTeam: Bool = true;
    @AppStorage("teamInfo.topTeam.score") var topScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.score") var bottomScore: Int = 0;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.resetScoreTo") var resetScoreTo: Int = 0;
    @AppStorage("teamInfo.topTeam.scoreColor") var topScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.scoreColor") var bottomScoreColor: String = Data.colorToString(color: Color.white);

    var body: some View {
        Text(String(isTopTeam ? topScore : bottomScore)).font(.system(size: CGFloat(96))).onTapGesture(count: 2) {
            decrementScore();
        }.onTapGesture(count: 1) {
            incrementScore();
        }.onLongPressGesture(minimumDuration: 1) {
            resetScore();
        }.foregroundColor(isTopTeam ? Data.stringToColor(color: topScoreColor) : Data.stringToColor(color: bottomScoreColor));
    }
    
    func resetScore() -> Void {
        if (isTopTeam) {
            topScore = resetScoreTo;
        } else {
            bottomScore = resetScoreTo;
        }
    }
    func incrementScore() -> Void {
        if (isTopTeam) {
            topScore = scoreIncreases ? topScore + increment : topScore - increment;
        } else {
            bottomScore = scoreIncreases ? bottomScore + increment : bottomScore - increment;
        }
    }
    func decrementScore() -> Void {
        if (isTopTeam) {
            topScore = scoreIncreases ? topScore - increment : topScore + increment;
        } else {
            bottomScore = scoreIncreases ? bottomScore - increment : bottomScore + increment;
        }
    }
}
