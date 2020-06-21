//
//  BaseURL.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import Foundation

enum BaseURL {

    // Normally, there would be separate environments
    static var apiURL: URL {
        return URL(string: "https://jsonplaceholder.typicode.com")!
    }
}
