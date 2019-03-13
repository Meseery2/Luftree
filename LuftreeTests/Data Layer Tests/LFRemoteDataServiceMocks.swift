//
//  LFRemoteDataServiceMock.swift
//  LuftreeTests
//
//  Created by Mohamed EL Meseery on 3/13/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation
@testable import Luftree

class LFTokenServiceMock: TokenService {
    var accessToken: Token?

    var authHeader: [String: String]? {
        return ["Authorization": accessToken?.authToken ?? ""]
    }

    func getToken(_ onCompletion: ((Token?) -> Void)?) {
        let token = Token(accessToken: "",
                               tokenType: "Bearer",
                               expiry: nil)
        onCompletion?(token)
    }
}

class LFNetworkServiceMock: NetworkServiceType {
    var extraHeaders: [String: String]?
    var isValidData: Bool
    var stubFileName: String

    init(_ isValidData: Bool, stubFilename: String) {
        self.isValidData = isValidData
        self.stubFileName = stubFilename
    }

    func getEntity<T: Codable>(forEndpoint endpoint: EndpointType,
                               onCompletion: @escaping (Result<T, NetworkError>) -> Void) {
        if isValidData {
            if let path = Bundle.init(for: type(of: self)).path(forResource: stubFileName, ofType: ".json") ,
                let data = try? Data(contentsOf: URL.init(fileURLWithPath: path)),
                let entity = try? JSONDecoder().decode(T.self, from: data) {
                onCompletion(.success(entity))
            }
        } else {
            onCompletion(.failure(NetworkError.invalidData))
        }
    }

}

struct SearchParamMock {
    static var searchParameters: SearchParams {
        let origin = LFAirport.init(name: "Airport1", iata: "A1", city: "Any", lat: "Any", lon: "Any")
        let destination = LFAirport.init(name: "Airport2", iata: "A2", city: "Any", lat: "Any", lon: "Any")
        let date = Date()
        let isDirectFlight = false
        return SearchParams(origin, destination, date, isDirectFlight)
    }
}
