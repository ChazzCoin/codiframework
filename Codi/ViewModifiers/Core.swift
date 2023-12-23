//
//  CoreMods.swift
//  Ludi Boards
//
//  Created by Charles Romeo on 11/13/23.
//

import Foundation
import SwiftUI

extension View {
    public func enableDragAndDrop() -> some View {
        self.modifier(lbDragger())
    }
    
    public func solEnabled(isEnabled: Bool) -> some View {
        self.modifier(SolButtonModifier(isEnabled: isEnabled))
    }
    
    public func onTap(perform action: @escaping () -> Void) -> some View {
        self.onTapGesture {
            hapticFeedback()
            // Perform the custom action
            action()
        }
    }
    public func onTapAnimation(perform action: @escaping () -> Void) -> some View {
        self.modifier(TapAnimationModifier(action: action))
    }
    
    public func onDoubleTap(scale: CGFloat = 2.0, duration: Double = 0.5, completion: @escaping () -> Void = {}) -> some View {
        modifier(DoubleTapExplodeModifier(scale: scale, duration: duration, completion: completion))
    }
    
    // Method to set the position of the view based on a specified ScreenArea
    public func position(using gps: GlobalPositioning, at area: ScreenArea, offsetX: CGFloat = 0, offsetY: CGFloat = 0) -> some View {
        self.position(gps.getCoordinate(for: area, offsetX: offsetX, offsetY: offsetY))
    }

    // Method to set the offset of the view based on a specified ScreenArea
    public func offset(using gps: GlobalPositioning, for area: ScreenArea) -> some View {
        let offsetSize = gps.getOffset(for: area)
        return self.offset(x: offsetSize.width, y: offsetSize.height)
    }
}

public func backgroundColorForScheme(_ scheme: ColorScheme) -> Color {
    switch scheme {
        case .light:
            // Use a color suitable for light mode
            return Color.black.opacity(0.8)
        case .dark:
            // Use a color suitable for dark mode
            return Color.white.opacity(0.8)
        @unknown default:
            // Fallback for future color schemes
            return Color.gray.opacity(0.8)
        }
}

public func foregroundColorForScheme(_ scheme: ColorScheme) -> Color {
    switch scheme {
        case .dark:
            // Use a color suitable for light mode
            return Color.black.opacity(0.8)
        case .light:
            // Use a color suitable for dark mode
            return Color.white.opacity(0.8)
        @unknown default:
            // Fallback for future color schemes
            return Color.gray.opacity(0.8)
        }
}

public struct SolButtonModifier: ViewModifier {
    public var isEnabled: Bool

    public func body(content: Content) -> some View {
        content
            .opacity(isEnabled ? 1 : 0.5) // Change opacity when disabled
            .disabled(!isEnabled) // Disable button interaction
    }
}

public func simpleSuccessHaptic() {
    let generator = UINotificationFeedbackGenerator()
    generator.notificationOccurred(.success)
}

public func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle = .heavy) {
    let generator = UIImpactFeedbackGenerator(style: style)
    generator.impactOccurred()
}


