//
//  Arrival.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct Arrival: Codable {
    let airportCode: String?
    let scheduledTimeLocal: ScheduledTimeLocal?
    let terminal: Terminal?

    private enum CodingKeys: String, CodingKey {
        case airportCode = "AirportCode"
        case scheduledTimeLocal = "ScheduledTimeLocal"
        case terminal = "Terminal"
    }

    init(airportCode: String?,
         scheduledTimeLocal: ScheduledTimeLocal?,
         terminal: Terminal?) {
        self.airportCode = airportCode
        self.scheduledTimeLocal = scheduledTimeLocal
        self.terminal = terminal
    }
}
