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
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Change Score By")) {
                    TextField("Amount", value: $increment, formatter: NumberFormatter()).keyboardType(.numberPad);
                }
                Section(header: Text("Reset Score To")) {
                    TextField("Score", value: $resetScore, formatter: NumberFormatter()).keyboardType(.numberPad);
                }
                Section(header: Text("Other Options")) {
                    Toggle("Score Increases", isOn: $scoreIncreases);
                    
                }
                Button("Reset To Default") {
                    increment = 1;
                    scoreIncreases = true;
                    resetScore = 0;
                }
            }
        }
    }
}
