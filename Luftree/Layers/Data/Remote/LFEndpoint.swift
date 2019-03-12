//
//  LFSchedulesEndpoint.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Alamofire

typealias SearchParams = (origin: LFAirport,
    destination: LFAirport,
    date: Date,
    isDirectFlight: Bool?)

enum LFEndpoint: EndpointType {
    case token
    case search(SearchParams)

    var baseURL: URL? {
        return URL(string: LFAPIConstants.APIBaseURL)
    }

    var path: String {
        switch self {
        case .token:
            return "oauth/token"
        case let .search(origin, dest, date, _):
            var path = URL(string: "operations/schedules")
            path?.appendPathComponent(origin.iata)
            path?.appendPathComponent(dest.iata)
            path?.appendPathComponent(
                    date.scheduleStringRepresentation())
            return path?.absoluteString ?? ""
        }
    }

    var method: HTTPMethod {
        switch self {
        case .token:
            return .post
        case .search:
            return .get
        }
    }

    var parameters: [String: Any] {
        switch self {
        case .token:
            return ["client_id": LFAPIConstants.Auth.APIClientID, "client_secret": LFAPIConstants.Auth.APIClientSecret,
                    "grant_type": LFAPIConstants.Auth.APIGrantType]
        case let .search(_, _, _, isDirectFlight):
            return ["directFlights": isDirectFlight ?? false]
        }
    }

    var headers: [String: String]? {
        switch self {
        case .token:
            return ["Content-Type": "application/x-www-form-urlencoded"]
        default:
            return ["Accept": "application/json"]
        }
    }
}
