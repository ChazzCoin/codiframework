//
//  OnDoubleTap.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation
import SwiftUI

public struct DoubleTapExplodeModifier: ViewModifier {
    let scale: CGFloat
    let duration: Double
    let completion: () -> Void

    @State private var isAnimating = false

    public func body(content: Content) -> some View {
        content
            .scaleEffect(isAnimating ? scale : 1.0)
            .animation(.easeInOut(duration: duration), value: isAnimating)
            .onTapGesture(count: 2) {
                isAnimating = true
                DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                    isAnimating = false
                    completion()
                }
            }
    }
}

