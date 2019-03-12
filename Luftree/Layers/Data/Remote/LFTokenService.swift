//
//  LFTokenStore.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol TokenService {
    var authHeader: [String: String]? { get }
    func getToken(_ onCompletion: ((Token?) -> Void)?)
}

class LFTokenService: TokenService {
    private enum Constant {
        static let accessTokenKey = "accessToken"
        static let authorizationKey = "Authorization"
    }

    static var instance: TokenService {
        return LFTokenService()
    }

    init() {
        guard accessToken != nil else {
            getToken()
            return
        }
    }

    var authHeader: [String: String]? {
        guard let auth = accessToken?.authToken else {
            return nil
        }
        return [Constant.authorizationKey: auth]
    }

    var accessToken: Token? {
        get {
            return UserDefaults.standard.get(Token.self, with: Constant.accessTokenKey)
        }
        set {
            UserDefaults.standard.set(object: newValue, forKey: Constant.accessTokenKey)
        }
    }

    func getToken(_ onCompletion: ((Token?) -> Void)? = nil) {
        let tokenEndpoint = LFEndpoint.token
        tokenEndpoint
            .execute(networkService: LFNetworkService.instance) { [weak self] (result: Result<Token, NetworkError>) in
                if case let .success(token) = result {
                    self?.accessToken = token
                    onCompletion?(token)
                } else {
                    onCompletion?(nil)
                }
        }
    }
}
