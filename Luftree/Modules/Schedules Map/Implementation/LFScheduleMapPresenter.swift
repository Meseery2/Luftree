//
//  ScheduleMapDefaultPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import CoreLocation

class LFScheduleMapPresenter: ScheduleMapPresenter {

    var router: ScheduleMapRouter?
    weak var view: ScheduleMapView?
    var schedule: Schedule
    private let localDataService = LFLocalDataService()

    var viewTitle: String? {
        return schedule.stopsCount
    }

    init(_ schedule: Schedule) {
        self.schedule = schedule
    }

    func viewDidLoad() {
        view?.showScheduleOnMap(getCoordinates(schedule))
    }
}

extension LFScheduleMapPresenter {
    fileprivate func getCoordinates(_ schedule: Schedule) -> [[CLLocationCoordinate2D]] {
        var coordinatesArray = [[CLLocationCoordinate2D]]()
        schedule.flights?.forEach({ flight in
            if let flightCoordinates = getCoordinates(for: flight) {
                coordinatesArray.append(flightCoordinates)
            }
        })
        return coordinatesArray
    }

    fileprivate func getCoordinates(for flight: Flight) -> [CLLocationCoordinate2D]? {
        guard let source = localDataService.airport(with: flight.departure?.airportCode)?.coordinates,
            let destination = localDataService
                .airport(with: flight.arrival?.airportCode)?
                .coordinates else { return nil }
        return [source, destination]
    }
}
