//
//  LFRemoteDataService.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol DataService {}

typealias CompletionClosure<T> = (Result<T, NetworkError>) -> Void

class LFRemoteDataService: DataService {
    private var networkService: NetworkServiceType?
    private var tokenService: TokenService?

    init(networkService: NetworkServiceType,
         tokenService: TokenService) {
        self.networkService = networkService
        self.tokenService = tokenService
    }

    func fetchSchedules(searchParams: SearchParams,
                        onCompletion: @escaping CompletionClosure<[Schedule]?>) {
        let searchEndPoint = LFEndpoint.search(searchParams)
        networkService?.extraHeaders = tokenService?.authHeader
        searchEndPoint
            .execute(networkService: networkService) { [weak self](result: Result<SchedulesResponse, NetworkError>) in
                guard let `self` = self else { return }
                switch result {
                case let .success(schedule):
                    onCompletion(
                        .success(
                            schedule
                                .scheduleResource?
                                .schedules))
                case let .failure(error):
                    self.handleError(error,
                                     endPoint: searchEndPoint,
                                     onCompletion: onCompletion)
                }
        }
    }

    func handleError<T: Codable>(_ error: NetworkError,
                                 endPoint: EndpointType,
                                 onCompletion: CompletionClosure<T>?) {
        if case .networkError(401) = error {
            tokenService?.getToken { [weak self] token in
                guard let `self` = self else { return }
                if token != nil {
                    endPoint
                        .execute(networkService: self.networkService,
                                     onCompletion: onCompletion)
                } else {
                    onCompletion?(
                        .failure(NetworkError
                            .accessTokenUnavailable))
                }
            }
        } else {
            onCompletion?(.failure(error))
        }
    }
}
