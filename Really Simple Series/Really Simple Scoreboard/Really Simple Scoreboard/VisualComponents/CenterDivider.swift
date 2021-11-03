//
//  PressListener.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct CenterDivider: View {

    @State var direction: String = "Horizontal";

    var body: some View {
        GeometryReader { geo in
            let height = geo.size.height;
            let width = geo.size.width;
            let thickness = 5;
            Path() { path in
                if (direction == "Horizontal") {
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
        return UITraitCollection.current.userInterfaceStyle == .dark ? Color.white : Color.black;
    }
}
