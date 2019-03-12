//
//  SearchDefaultInteractor.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

class LFSearchInteractor: SearchInteractor {
    private var remoteDataService: LFRemoteDataService?
    private var localDataService: LFLocalDataService?

    weak var presenter: SearchPresenter?

    init(remoteDataService: LFRemoteDataService,
         localDataService: LFLocalDataService) {
        self.remoteDataService = remoteDataService
        self.localDataService = localDataService
    }

    init() {
        self.remoteDataService = LFRemoteDataService(
            networkService: LFNetworkService.instance, tokenService: LFTokenService.instance)
        self.localDataService = LFLocalDataService()
    }

    func searchSchedules(from origin: LFAirport,
                         to destination: LFAirport,
                         on date: Date,
                         isDirectFlight: Bool?,
                         onCompletion: @escaping (Result<[Schedule]?, NetworkError>) -> Void) {
        let params = SearchParams(origin,
                                  destination,
                                  date,
                                  isDirectFlight)

        remoteDataService?.fetchSchedules(searchParams: params,
                                          onCompletion: onCompletion)
    }

    func searchAirports(_ keyword: String,
                        onCompletion: @escaping (Result<[LFAirport]?, LocalError>) -> Void) {
        do {
            if let airports = try localDataService?.search(with: keyword) {
                onCompletion(.success(airports))
            }
        } catch let error as LocalError {
            onCompletion(.failure(error))
        } catch {}
    }
}
