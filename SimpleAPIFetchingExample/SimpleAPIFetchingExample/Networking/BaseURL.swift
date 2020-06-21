//
//  BaseURL.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import Foundation

enum BaseURL {

    enum Environment {
        case dev
        case staging
    }

    static var apiURL: URL {
        guard let env = ProcessInfo.processInfo.environment["environment"]
            else { assertionFailure(); return URL(string: "https://www.google.com")! }

        // Normally, there would be separate environments
        switch env {
        case "dev", "staging", "live":
            return URL(string: "https://jsonplaceholder.typicode.com")!
        default:
            assertionFailure("undefined environment")
            return URL(string: "https://www.google.com")!
        }
    }
}
