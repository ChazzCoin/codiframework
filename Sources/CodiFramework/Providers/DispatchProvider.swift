//
//  DispatchProvider.swift
//  Codi
//
//  Created by Charles Romeo on 12/22/23.
//

import Foundation


extension DispatchQueue {
    static public func executeAfter(seconds: TimeInterval, on queue: DispatchQueue = .main, action: @escaping () -> Void) {
        queue.asyncAfter(deadline: .now() + seconds, execute: action)
    }
}
