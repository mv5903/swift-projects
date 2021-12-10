//
//  PressListener.swift
//  Dummy Scoreboard
//
//  Created by Matthew Vandenberg on 10/31/21.
//

import SwiftUI

struct CenterDivider: View {

    @State var direction: String = "Horizontal";
    @Environment(\.colorScheme) var colorScheme;

    var body: some View {
        GeometryReader { geo in
            let height = CGFloat(geo.size.height);
            let width = geo.size.width;
            let thickness = 3;
            
            if (direction == "Horizontal") {
                Rectangle()
                    .frame(width: width*2, height: thickness*2)
                    .background(Color.white)
                    .position(x: 0, y: height/2 - CGFloat(thickness))
            } else {
                Rectangle()
                    .frame(width: thickness*2, height: height*2)
                    .background(Color.white)
                    .position(x: width/2 - CGFloat(thickness), y: 0)
            }
        }
        
    }
    
}

