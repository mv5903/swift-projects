//
//  Gear.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct Gear: View {
    @State var isPresented: Bool = false;
    var body: some View {
        Image(systemName: "gear")
            .onTapGesture {
                self.isPresented = true;
            }
            .sheet(isPresented: $isPresented, content: {
            Options();
        });
    }
}
