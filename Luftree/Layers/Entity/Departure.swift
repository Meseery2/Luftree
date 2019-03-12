//
//  Departure.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct Departure: Codable {
    let airportCode: String?
    let scheduledTimeLocal: ScheduledTimeLocal?

    private enum CodingKeys: String, CodingKey {
        case airportCode = "AirportCode"
        case scheduledTimeLocal = "ScheduledTimeLocal"
    }

    init(airportCode: String?,
         scheduledTimeLocal: ScheduledTimeLocal?,
         terminal: Terminal?) {
        self.airportCode = airportCode
        self.scheduledTimeLocal = scheduledTimeLocal
    }
}
