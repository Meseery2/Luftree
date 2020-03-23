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
