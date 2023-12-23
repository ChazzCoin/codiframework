//
//  TimeProvider.swift
//  Codi
//
//  Created by Charles Romeo on 12/21/23.
//

import Foundation

public class TimeProvider {
    private let dateFormatter: ISO8601DateFormatter

    public init() {
        dateFormatter = ISO8601DateFormatter()
        dateFormatter.formatOptions = [.withInternetDateTime, .withFractionalSeconds]
    }

    // Generates a timestamp string in ISO 8601 format
    public func generateTimestamp() -> String {
        return dateFormatter.string(from: Date())
    }

    // Parses a timestamp string in ISO 8601 format into a Date object
    public func parseTimestamp(_ timestamp: String) -> Date? {
        return dateFormatter.date(from: timestamp)
    }
}
