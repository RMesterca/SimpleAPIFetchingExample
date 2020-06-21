//
//  ConsoleLogger.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

typealias Console = ConsoleLogger

// NOTE: - Utility to make console logging more visible
enum ConsoleLogger {

    enum ConsoleEventType {
        case success
        case error
        case message
        case warning

        var emoji: String {
            switch self {
            case .success:
                return "🎉"
            case .error:
                return "🔴❗️"
            case .warning:
                return "⚠️"
            case .message:
                return "📩"
            }
        }
    }

    static func log(type: ConsoleEventType = .message, _ message: String) {
        print("""

            \(type.emoji) ===========================
            \(message)
            \(type.emoji) ===========================

            """)
    }
}
