//
//  ViewWrapper.swift
//  Ludi Boards
//
//  Created by Charles Romeo on 11/17/23.
//

import Foundation
import SwiftUI

// Define a wrapper for your view closures
public struct CodiViewWrapper: Identifiable {
    public let id: UUID
    public let viewClosure: () -> AnyView

    public init(id: UUID = UUID(), viewClosure: @escaping () -> AnyView) {
        self.id = id
        self.viewClosure = viewClosure
    }

    public func view() -> AnyView {
        viewClosure()
    }
}
