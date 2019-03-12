//
//  LFNetworkError.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

extension LocalizedError where Self: CustomStringConvertible {
    var errorDescription: String? {
        return description
    }
}

enum NetworkError: LocalizedError, CustomStringConvertible {
    case networkError(Int)
    case noInternetConection
    case invalidEndpoint
    case networkException
    case parsingError
    case invalidData
    case accessTokenUnavailable

    var description: String {
        switch self {
        case .noInternetConection:
            return "Please check your internet connection"
        case .invalidEndpoint, .networkException, .parsingError:
            return "Something went wrong!"
        case .invalidData:
            return "Unable to fetch results!"
        case .accessTokenUnavailable:
            return "Something went wrong, please try again shortly!"
        case let .networkError(errorCode):
            switch errorCode {
            case 404:
                return "Sorry, couldn't find results matching your query"
            default:
                return "Sorry! unable to serve you this time"

            }
        }
    }
}
