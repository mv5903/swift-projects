//
//  Gear.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct Gear: View {
    @AppStorage("isPresented") var isPresented: Bool = false;
    var body: some View {
        Image(systemName: "gear").resizable().scaledToFill().frame(width: 25, height: 25)
            .onTapGesture {
                self.isPresented = true;
            }.sheet(isPresented: $isPresented, content: {
            Options();
        });
    }
}
