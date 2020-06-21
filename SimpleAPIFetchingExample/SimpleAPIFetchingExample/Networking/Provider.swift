//
//  Provider.swift
//  SimpleAPIFetchingExample
//
//  Created by Raluca Mesterca on 21/06/2020.
//  Copyright © 2020 Fig. All rights reserved.
//

import Moya
//import Result

typealias RequestCompletion<T> = (Result<T, MoyaError>) -> Void

protocol MoyaClientProtocol {
    associatedtype Target: TargetType

    func request<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T>)
}

class MoyaClient<Target: TargetType>: MoyaClientProtocol {

    private let provider: MoyaProvider<Target>
    private var applicationJSONDecoder: JSONDecoder {
        let decoder = JSONDecoder()
        return decoder
    }

    init() {
        let plugins: [PluginType] = [NetworkLoggerPlugin() ]
        provider = MoyaProvider<Target>(plugins: plugins)
    }

    func request<T: Codable>(_ target: Target, _ completion: @escaping RequestCompletion<T> ) {
        provider.request(target) { response in
            print(response)
            switch response {
            case .success(let value):
                do {
                    let decodedData = try value.filterSuccessfulStatusCodes().map(T.self)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(MoyaError.underlying(error, nil)))
                }
            case .failure(let err):
                completion(.failure(err))
            }
        }
    }
}
