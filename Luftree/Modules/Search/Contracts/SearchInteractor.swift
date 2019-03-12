//
//  SearchInteractor.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol SearchInteractor {
    var presenter: SearchPresenter? { get set }
    func searchSchedules(from origin: LFAirport,
                         to destination: LFAirport,
                         on date: Date,
                         isDirectFlight: Bool?,
                         onCompletion: @escaping (Result<[Schedule]?, NetworkError>) -> Void)
    func searchAirports(_ keyword: String,
                        onCompletion: @escaping (Result<[LFAirport]?, LocalError>) -> Void)
}
