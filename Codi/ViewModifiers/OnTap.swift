//
//  OnTap.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation
import SwiftUI

public struct TapAnimationModifier: ViewModifier {
    let action: () -> Void
    @State private var isPressed = false

    public func body(content: Content) -> some View {
        content
            .scaleEffect(isPressed ? 0.75 : 1.0)
            .animation(.easeInOut(duration: 0.2), value: isPressed)
            .onTapGesture {
                self.isPressed = true
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                    self.isPressed = false
                    self.action()
                }
            }
    }
}
