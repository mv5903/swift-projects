//
//  Options.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct Options: View {
    @AppStorage("increment") var increment: Int = 1;
    @AppStorage("scoreIncreases") var scoreIncreases: Bool = true;
    @AppStorage("resetScore") var resetScore: Int = 0;
    @AppStorage("isPresented") var isPresented: Bool = false;
    @AppStorage("showCenterDivider") var showCenterDivider: Bool = true;
    var body: some View {
        ZStack () {
            NavigationView {
                Form {
                    Section(header: Text("Change Score By")) {
                        TextField("Amount", value: $increment, formatter: NumberFormatter()).keyboardType(.numberPad);
                    }
                    Section(header: Text("Reset Score To")) {
                        TextField("Score", value: $resetScore, formatter: NumberFormatter()).keyboardType(.numberPad);
                    }
                    Section(header: Text("Other Options"), footer: Text(scoreIncreases ? "Score will increase when tapping the score." : "Score will decrease when tapping the score.")) {
                        Toggle("Score Increases", isOn: $scoreIncreases);
                    }
                    Section(footer: Text("Show divider between the two scores.")) {
                        Toggle("Show Center Divider", isOn: $showCenterDivider);
                    }
                    Button("Reset To Default") {
                        increment = 1;
                        scoreIncreases = true;
                        resetScore = 0;
                    }
                }
            }
            GeometryReader { geo in
                Image(systemName: "xmark.circle").resizable().scaledToFill().frame(width: 25, height: 25)
                    .onTapGesture {
                        isPresented = false;
                    }.position(x: geo.size.width - 25, y: 25)
            }
        }
    }
}
