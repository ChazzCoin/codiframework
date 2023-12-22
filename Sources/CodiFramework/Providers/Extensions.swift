//
//  Extensions.swift
//  Ludi Boards
//
//  Created by Charles Romeo on 11/27/23.
//

import Foundation
import CoreGraphics
import UIKit

extension CGSize {
    // Clamping the CGSize within certain width and height limits
    public func clamped(to limits: CGSize) -> CGSize {
        let clampedWidth = max(min(self.width, limits.width), 0) // Ensuring width is not negative
        let clampedHeight = max(min(self.height, limits.height), 0) // Ensuring height is not negative
        return CGSize(width: clampedWidth, height: clampedHeight)
    }
    
    // Adding to the width and height
    public func add(width deltaWidth: CGFloat, height deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width + deltaWidth, height: self.height + deltaHeight)
    }
    
    // Subtracting from the width and height
    public func subtract(width deltaWidth: CGFloat, height deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width - deltaWidth, height: self.height - deltaHeight)
    }

    // Increase width
    public func wider(by deltaWidth: CGFloat) -> CGSize {
        return CGSize(width: self.width + deltaWidth, height: self.height)
    }
    public func right(by deltaWidth: CGFloat) -> CGSize {
        return CGSize(width: self.width + deltaWidth, height: self.height)
    }

    // Increase height
    public func taller(by deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width, height: self.height + deltaHeight)
    }
    public func up(by deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width, height: self.height + deltaHeight)
    }

    // Decrease width
    public func narrower(by deltaWidth: CGFloat) -> CGSize {
        return CGSize(width: self.width - deltaWidth, height: self.height)
    }
    public func left(by deltaWidth: CGFloat) -> CGSize {
        return CGSize(width: self.width - deltaWidth, height: self.height)
    }

    // Decrease height
    public func shorter(by deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width, height: self.height - deltaHeight)
    }
    public func down(by deltaHeight: CGFloat) -> CGSize {
        return CGSize(width: self.width, height: self.height - deltaHeight)
    }
}
extension CGFloat {
    public func bounded(byMin minValue: CGFloat, andMax maxValue: CGFloat) -> CGFloat {
        return Swift.max(Swift.min(self, maxValue), minValue)
    }
}

extension CGPoint {
    
    public func toCGSize() -> CGSize {
        return CGSize(width: self.x, height: self.y)
    }
    
    public func clamped(to rect: CGRect) -> CGPoint {
        let clampedX = max(min(self.x, rect.maxX), rect.minX)
        let clampedY = max(min(self.y, rect.maxY), rect.minY)
        return CGPoint(x: clampedX, y: clampedY)
    }
    
    public func add(x deltaX: CGFloat, y deltaY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + deltaX, y: self.y + deltaY)
    }
    public func subtract(x deltaX: CGFloat, y deltaY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x - deltaX, y: self.y - deltaY)
    }
    
    public func up(y deltaY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: self.y - deltaY)
    }
    public func down(y deltaY: CGFloat) -> CGPoint {
        return CGPoint(x: self.x, y: self.y + deltaY)
    }
    
    public func left(x deltaX: CGFloat) -> CGPoint {
        return CGPoint(x: self.x - deltaX, y: self.y)
    }
    public func right(x deltaX: CGFloat) -> CGPoint {
        return CGPoint(x: self.x + deltaX, y: self.y)
    }
}

extension Double {
    public func bound(to range: ClosedRange<Double>) -> Double {
        return min(max(self, range.lowerBound), range.upperBound)
    }
}

