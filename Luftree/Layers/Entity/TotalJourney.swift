//
//  TotalJourney.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct TotalJourney: Codable {
    let duration: String?

    private enum CodingKeys: String, CodingKey {
        case duration = "Duration"
    }

    init(duration: String?) {
        self.duration = duration
    }

    var durationTime: Int {
        return (days * 24 * 60) + (hours * 60) + minutes
    }

    var days: Int {
        if let duration = duration,
            duration.contains("D"),
            let daysCount = duration.slice(fromString: "P", toString: "D") {
            return Int(daysCount) ?? 0
        }
        return 0
    }

    var hours: Int {
        if let duration = duration,
            duration.contains("H"),
            let hoursCount = duration.slice(fromString: "T", toString: "H") {
            return Int(hoursCount) ?? 0
        }
        return 0
    }

    var minutes: Int {
        if let duration = duration {
            if !duration.contains("H") {
                return Int(duration.slice(fromString: "T", toString: "M") ?? "") ?? 0
            } else {
                return Int(duration.slice(fromString: "H", toString: "M") ?? "") ?? 0
            }
        }
        return 0
    }
}
