//
//  LFLocalDataManager.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

enum LocalError: Error {
    case invalidSearchKeyword
    case noDataFound
}

class LFLocalDataService: DataService {
    private static let localAirportsFile = "airports"
    private var airports: [LFAirport]?

    init() {
        readLocalAirports()
    }

    init(_ airports: [LFAirport]) {
        self.airports = airports
    }

    func airport(with iata: String?) -> LFAirport? {
        guard let iata = iata else { return nil }
        return airports?.first { $0.iata.caseInsensitiveCompare(iata) == .orderedSame }
    }

    func search(with keyword: String) throws -> [LFAirport] {
        guard !keyword.isEmpty else {
            throw LocalError.invalidSearchKeyword
        }
        guard let airports = airports else {
            throw LocalError.noDataFound
        }
        return airports.filter { $0.city.lowercased().starts(with: keyword.lowercased()) }
    }

    private func readJSONFromFile(named fileName: String,
                                  inBundle bundle: Bundle) -> Data? {
        guard let path = bundle.path(forResource: fileName,
                                     ofType: "json") else { return nil }
        let data = try? Data(contentsOf: URL(fileURLWithPath: path))
        return data
    }

    private func readLocalAirports() {
        guard let airportsData = readJSONFromFile(named: LFLocalDataService
            .localAirportsFile, inBundle: .main) else { return }
        if let airports = try? JSONDecoder().decode([LFAirport].self, from: airportsData) {
            self.airports = airports
        }
    }
}
