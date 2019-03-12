//
//  Flight.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct Flight: Codable {
    let departure: Departure?
    let arrival: Arrival?

    private enum CodingKeys: String, CodingKey {
        case departure = "Departure"
        case arrival = "Arrival"
    }

    init(departure: Departure?,
         arrival: Arrival?) {
        self.departure = departure
        self.arrival = arrival
    }
}

struct ScheduledTimeLocal: Codable {
    let dateTime: String?

    private enum CodingKeys: String, CodingKey {
        case dateTime = "DateTime"
    }

    init(dateTime: String?) {
        self.dateTime = dateTime
    }
}
