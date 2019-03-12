//
//  LFSchedulesDefaultPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

class LFSchedulesListPresenter: SchedulesPresenter {
    var viewTitle: String {
        if let count = schedules?.count {
            return "\(count)" + " " + "Schedule"
        }
        return ""
    }

    var schedulesCount: Int {
        return schedules?.count ?? 0
    }

    var schedules: [Schedule]?
    var router: SchedulesRouter?
    weak var view: SchedulesView?
}

extension LFSchedulesListPresenter {
    func viewDidLoad() {
        sortSchedules()
        view?.showSchedules()
    }
}

extension LFSchedulesListPresenter {
    private func sortSchedules() {
        schedules?.sort(by: { first, second in
            guard let duration1 = first.totalJourney?.durationTime else {
                return false
            }
            guard let duration2 = second.totalJourney?.durationTime else {
                return false
            }
            return duration1 < duration2
        })
    }
}

extension LFSchedulesListPresenter {
    func configScheduleView(_ view: ScheduleViewable,
                            at indexPath: IndexPath) {
        guard let schedule = schedules?[indexPath.row] else { return }
        view.departureTime = schedule.departureTime?.timeRepresentaion()
        view.arrivalTime = schedule.arrivalTime?.timeRepresentaion()
        view.stops = schedule.stopsCount
        view.arrivalTerminal = schedule.terminal
    }

    func userDidSelectSchedule(at indexPath: IndexPath) {
        guard let schedule = schedules?[indexPath.row] else {
            return
        }
        router?.navigateToMap(with: schedule)
    }
}
