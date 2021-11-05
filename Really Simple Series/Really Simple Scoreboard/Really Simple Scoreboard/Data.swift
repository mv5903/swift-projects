//
//  Data.swift
//  Really Simple Scoreboard
//
//  Created by Matthew Vandenberg on 11/4/21.
//

import Foundation
import SwiftUI

struct Data {
    @AppStorage("teamInfo.topTeam.name") var topTeamName: String = "Top Team";
    @AppStorage("teamInfo.topTeam.score") var topTeamScore: Int = 0;
    @AppStorage("teamInfo.bottomTeam.name") var bottomTeamName: String = "Bottom Team";
    @AppStorage("teamInfo.bottomTeam.score") var bottomTeamScore: Int = 0;
    @AppStorage("deviceInfo.orientation") var orientation: String = "Portrait";
    @AppStorage("deviceInfo.showTeamNames") var showTeamNames: Bool = true;
    @AppStorage("scoreInfo.scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("scoreInfo.incrementScoreBy") var increment: Int = 1;
    @AppStorage("scoreInfo.resetScoreTo") var reset: Int = 0;
}
