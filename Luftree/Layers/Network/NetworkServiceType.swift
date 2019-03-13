//
//  NetworkServiceType.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol NetworkServiceType {
    var extraHeaders: [String: String]? { get set }
    func getEntity<T: Codable>(
        forEndpoint endpoint: EndpointType,
        onCompletion: @escaping CompletionClosure<T>)
}
