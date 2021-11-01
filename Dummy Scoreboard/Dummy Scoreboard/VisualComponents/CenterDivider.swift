//
//  PressListener.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct CenterDivider: View {
    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height;
            let width = geo.size.width;
            let thickness = 20;
            Path() { path in
                path.move(to: CGPoint(x: 0, y: (Int)(height/2) + thickness));
                path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) + thickness)));
                path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) - thickness)));
                path.addLine(to: CGPoint(x: 0, y: (Int)(height/2) - thickness));
            }.fill(UITraitCollection.current.userInterfaceStyle == .dark ? Color.white : Color.black);
        }
    }
}
