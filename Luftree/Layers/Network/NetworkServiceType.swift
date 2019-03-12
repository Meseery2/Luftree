//
//  NetworkServiceType.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol NetworkServiceType {
    func getEntity<T: Codable>(
        forEndpoint endpoint: EndpointType,
        onCompletion: @escaping CompletionClosure<T>)

    func getEntities<T: Codable>(
        forEndpoint endpoint: EndpointType,
        onCompletion: @escaping CompletionClosure<[T]>)

    var extraHeaders: [String: String]? { get set }
}
