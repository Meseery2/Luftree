//
//  LFNetworkService.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit
import Alamofire

enum Result<T, U: Error> {
    case success(T)
    case failure(U)
}

class LFNetworkService: NetworkServiceType {
    public var extraHeaders: [String: String]?

    private var sessionManager: SessionManager?

    public static let instance: LFNetworkService = {
        return LFNetworkService(SessionManager.default)
    }()

    init(_ sessionManager: SessionManager) {
        self.sessionManager = sessionManager
    }

    func getEntity<T: Codable>(forEndpoint endpoint: EndpointType,
                               onCompletion: @escaping (Result<T, NetworkError>) -> Void) {
        execute(endpoint: endpoint) { (result) in
            switch result {
            case let .success(data):
                do {
                    let entity = try JSONDecoder().decode(T.self, from: data)
                    onCompletion(.success(entity))
                } catch {
                    if error is DecodingError {
                        onCompletion(
                            .failure(NetworkError.parsingError))
                    }
                }
            case let .failure(error):
                onCompletion(.failure(error))
            }
        }
    }

    private func execute(endpoint: EndpointType,
                         onCompletion: @escaping (Result<Data, NetworkError>) -> Void) {
            guard NetworkReachabilityManager()!.isReachable else {
                onCompletion(
                    .failure(NetworkError.noInternetConection))
                return
            }

            guard let manager = sessionManager else {
                onCompletion(
                    .failure(NetworkError.networkException))
                return
            }

            guard let path = endpoint
                .baseURL?
                .appendingPathComponent(endpoint.path) else {
                onCompletion(
                    .failure(NetworkError.invalidEndpoint))
                return
            }
            var requestHeaders = endpoint.headers
            if let extraHeaders = extraHeaders {
                requestHeaders?.merge(dict: extraHeaders)
            }

            let request = manager.request(path,
                            method: endpoint.method,
                            parameters: endpoint.parameters,
                            headers: requestHeaders)
            request
            .validate()
            .responseData { response in
                if response.result.isSuccess,
                    let data = response.result.value {
                    onCompletion(.success(data))
                } else if response.result.isFailure {
                    if let statusCode = response.response?.statusCode {
                        onCompletion(
                            .failure(.networkError(statusCode)))
                    }
                }
        }
    }
}
