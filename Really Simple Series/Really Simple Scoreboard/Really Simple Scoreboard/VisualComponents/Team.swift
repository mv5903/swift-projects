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
    
    @Environment(\.colorScheme) var colorScheme;
    
    var body: some View {
        
        if orientation == "Portrait" {
            !isTop ? Score(isTopTeam: false) : nil;
            
            if (showTeamNames) {
                Text(isTop ? topName : bottomName).font(.system(size: CGFloat(46))).foregroundColor(isTop ? getColor(col: topColor) : getColor(col: bottomColor));
            }
            
            isTop ? Score(isTopTeam: true) : nil;
        } else {
            VStack(alignment: .center, spacing: 50) {
                if (showTeamNames) {
                    Text(isTop ? topName : bottomName).font(.system(size: CGFloat(46))).foregroundColor(isTop ? getColor(col: topColor) : getColor(col: bottomColor));
                }
                Score(isTopTeam: isTop);
            }
        }
    }
    
    
    func getColor(col: String) -> Color {
        //First, check if variale matches a dark or light mode scheme and make sure they don't conflict
        let backgroundColor = colorScheme == .dark ? Color.black : Color.white;
        if (col == Data.colorToString(color: backgroundColor)) {
            //If we enter this if block, we conclude that the background color is the same as the font color, which is a problem!
            //Let's reverse this accordingly:
            return col == Data.colorToString(color: Color.white) ? Color.black : Color.white;
        }
        //Second, if this isn't an issue, than return its color back;
        return Data.stringToColor(color: col);
    }
    
}

struct Score: View {
    @State var isTopTeam: Bool = true;
    @AppStorage("teamInfo.topTeam.score") var topScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.score") var bottomScore: Int = 0;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.resetScoreTo") var resetScoreTo: Int = 0;
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("teamInfo.topTeam.scoreColor") var topScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.scoreColor") var bottomScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("scoreInfo.fontSize") var scoreSize: Int = 90;
    
    @Environment(\.colorScheme) var colorScheme;
    
    var body: some View {
        Text(String(isTopTeam ? topScore : bottomScore))
            .font(.system(size:CGFloat(scoreSize))).gesture(DragGesture(minimumDistance: 20, coordinateSpace: .global)
                .onEnded { value in
                    let horizontalAmount = value.translation.width as CGFloat
                    let verticalAmount = value.translation.height as CGFloat
            
                    if abs(horizontalAmount) > abs(verticalAmount) {
                        if (horizontalAmount < 0) {
                            //Left Swipe
                            decrementScore();
                        } else {
                            //Right Swipe
                            incrementScore();
                        }
                    }
        }).onTapGesture(count: 1) {
            incrementScore();
        }.onLongPressGesture(minimumDuration: 1) {
            resetScore();
        }.foregroundColor(isTopTeam ? getColor(col: topScoreColor) : getColor(col: bottomScoreColor));
    }
    
    func getColor(col: String) -> Color {
        //First, check if variale matches a dark or light mode scheme and make sure they don't conflict
        let backgroundColor = colorScheme == .dark ? Color.black : Color.white;
        if (col == Data.colorToString(color: backgroundColor)) {
            //If we enter this if block, we conclude that the background color is the same as the font color, which is a problem!
            //Let's reverse this accordingly:
            return col == Data.colorToString(color: Color.white) ? Color.black : Color.white;
        }
        //Second, if this isn't an issue, than return its color back;
        return Data.stringToColor(color: col);
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
