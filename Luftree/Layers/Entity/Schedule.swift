//
//  Schedule.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct Schedule: Codable {
    let totalJourney: TotalJourney?
    let flights: [Flight]?

    private enum CodingKeys: String, CodingKey {
        case totalJourney = "TotalJourney"
        case flights = "Flight"
    }

    init(totalJourney: TotalJourney?,
         flights: [Flight]?) {
        self.totalJourney = totalJourney
        self.flights = flights
    }

    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        totalJourney = try? map.decode(TotalJourney.self, forKey: .totalJourney)
        guard let flight = try? map.decode(Flight.self, forKey: .flights) else {
            flights = try? map.decode([Flight].self, forKey: .flights)
            return
        }
        flights = [flight]
    }

    var departureTime: Date? {
        if let flight = self.flights?.first {
            return flight.departure?.scheduledTimeLocal?.dateTime?.scheduleTime()
        }
        return nil
    }

    var arrivalTime: Date? {
        if let flight = self.flights?.last {
            return flight.arrival?.scheduledTimeLocal?.dateTime?.scheduleTime()
        }
        return nil
    }

    var stopsCount: String? {
        if let flights = self.flights {
            switch flights.count {
            case 0, 1:
                return "No Stops"
            case 2:
                return "1 Stop"
            default:
                return "\(flights.count - 1) Stops"
            }
        }
        return nil
    }

    var terminal: String? {
        return flights?.reduce("Terminal: ") {$0 + ($1.arrival?.terminal?.name ?? "")}
    }
}
