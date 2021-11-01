//
//  PressListener.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct CenterDivider: View {
    @AppStorage("orientation") var orientated: String = "Portrait";
    @AppStorage("showCenterDivider") var showCenterDivider: Bool = true;

    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height;
            let width = geo.size.width;
            let thickness = 5;
            Path() { path in
                if (orientated == "Portrait") {
                    path.move(to: CGPoint(x: 0, y: (Int)(height/2) + thickness));
                    path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) + thickness)));
                    path.addLine(to: CGPoint(x: Int(width), y: (Int(height/2) - thickness)));
                    path.addLine(to: CGPoint(x: 0, y: (Int)(height/2) - thickness));
                } else {
                    path.move(to: CGPoint(x: Int(width/2) - thickness, y: 0));
                    path.addLine(to: CGPoint(x: Int(width/2) - thickness, y: Int(height)));
                    path.addLine(to: CGPoint(x: Int(width/2) + thickness, y: Int(height)));
                    path.addLine(to: CGPoint(x: Int(width/2) + thickness, y: 0));
                }
            }.fill(getFillColor());
        }
    }
    
    func getFillColor() -> Color {
        if (showCenterDivider) {
            return UITraitCollection.current.userInterfaceStyle == .dark ? Color.black : Color.white;
        }
        return getFillColorBasedOnSystem();
    }
    
    func getFillColorBasedOnSystem() -> Color {
        return UITraitCollection.current.userInterfaceStyle == .dark ? Color.white : Color.black;
    }
}
