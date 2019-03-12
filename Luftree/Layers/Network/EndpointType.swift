//
//  LFEndpoint.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Alamofire

protocol EndpointType {
    var baseURL: URL? { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var headers: [String: String]? { get }
}

extension EndpointType {
    func execute<T: Codable>
        (networkService: NetworkServiceType?,
         onCompletion: CompletionClosure<T>?) {
        networkService?
            .getEntity(forEndpoint: self) { (result: Result<T, NetworkError>) in
                switch result {
                case let .success(result):
                    onCompletion?(.success(result))
                case let .failure(error):
                    onCompletion?(.failure(error))
                }
        }
    }
}
