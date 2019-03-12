//
//  LFScheduleResponse.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct SchedulesResponse: Codable {
    var scheduleResource: ScheduleResource?

    private enum CodingKeys: String, CodingKey {
        case scheduleResource = "ScheduleResource"
    }
}

struct ScheduleResource: Codable {
    var schedules: [Schedule]?

    private enum CodingKeys: String, CodingKey {
        case schedules = "Schedule"
    }

    init(schedules: [Schedule]?) {
        self.schedules = schedules
    }
}
