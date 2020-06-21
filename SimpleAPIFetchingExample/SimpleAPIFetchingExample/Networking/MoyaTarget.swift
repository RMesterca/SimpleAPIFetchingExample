//
//  Target.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import Moya

// Note: - multiple targets can be used to split
// according to the scene they are used for
enum MoyaTarget: TargetType {

    case fetchPhotos

    var baseURL: URL {
        return BaseURL.apiURL
    }

    var path: String {
        return "/photos"
    }
    var method: Method {
        return .get
    }

    var sampleData: Data {
        return Data()
    }

    var task: Task {
        return .requestPlain
    }

    var headers: [String: String]? {
        return nil
    }
}
