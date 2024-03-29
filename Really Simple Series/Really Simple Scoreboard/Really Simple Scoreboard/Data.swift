//
//  Data.swift
//  Really Simple Scoreboard
//
//  Created by Matthew Vandenberg on 11/4/21.
//

import Foundation
import SwiftUI

struct Data {
    
    
    @AppStorage("teamInfo.topTeam.name") var topTeamName: String = "top.team.name";
    @AppStorage("teamInfo.topTeam.score") var topTeamScore: Int = 0;
    @AppStorage("teamInfo.topTeam.fontColor") var topTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.topTeam.scoreColor") var topScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "bottom.team.name";
    @AppStorage("teamInfo.bottomTeam.score") var bottomTeamScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.fontColor") var bottomTeamColor: String = Data.colorToString(color: Color.white);
    @AppStorage("teamInfo.bottomTeam.scoreColor") var bottomScoreColor: String = Data.colorToString(color: Color.white);
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("deviceInfo.showTeamNames") var showTeamNames: Bool = true;
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.resetScoreTo") var reset: Int = 0;
    @AppStorage("scoreInfo.fontSize") var scoreSize: Int = 36;

    @Environment(\.colorScheme) var colorScheme;
    
    func setAppearence() -> Void {
        topTeamColor = colorScheme == .dark ? Data.colorToString(color: Color.white) : Data.colorToString(color: Color.black);
        bottomTeamColor = colorScheme == .dark ? Data.colorToString(color: Color.white) : Data.colorToString(color: Color.black);
        topScoreColor = colorScheme == .dark ? Data.colorToString(color: Color.white) : Data.colorToString(color: Color.black);
        bottomScoreColor = colorScheme == .dark ? Data.colorToString(color: Color.white) : Data.colorToString(color: Color.black);
    }

    static func colorToString(color: Color) -> String {
        
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0

        UIColor(color).getRed(&red, green: &green, blue: &blue, alpha: &alpha)
        
        let colors = ["\(red)", "\(green)", "\(blue)", "\(alpha)"];
        
        return colors.joined(separator: ",");
    }
    
    static func stringToColor(color: String) -> Color {
        let array = color.components(separatedBy: ",")
        let doublearray = [Double(array[0]), Double(array[1]), Double(array[2]), Double(array[3])];
        return Color(red: doublearray[0] ?? 0, green: doublearray[1] ?? 0, blue: doublearray[2] ?? 0, opacity: doublearray[3] ?? 0);
    }
    
    static func getAppFont(size: CGFloat) -> Font {
        return Font.custom("San-Francisco", size: CGFloat(size));
    }
}

