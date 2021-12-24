//
//  SwiftExtensions.swift
//  Really Simple To-Do List
//
//  Created by Matthew Vandenberg on 12/16/21.
//

import Foundation
import SwiftUI

extension View {
    func hapticFeedbackOnTap(style: UIImpactFeedbackGenerator.FeedbackStyle = .light) -> some View {
        self.onTapGesture {
            let impact = UIImpactFeedbackGenerator(style: style)
            impact.impactOccurred()
        }
    }
}
