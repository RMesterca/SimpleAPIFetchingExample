//
//  AppService.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import Foundation

struct Photo: Codable {
    let albumId: Int
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

protocol ServiceProtocol {
    func fetchPhotos(_ completion: @escaping RequestCompletion<[Photo]>)
}

class Service: ServiceProtocol {
    private let client: MoyaClient<MoyaTarget>

    init(client: MoyaClient<MoyaTarget>) {
        self.client = client
    }

    func fetchPhotos(_ completion: @escaping RequestCompletion<[Photo]>) {
        client.request(.fetchPhotos, completion)
    }
}
