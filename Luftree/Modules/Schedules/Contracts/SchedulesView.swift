//
//  LFSchedulesViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

protocol SchedulesView: class {
    var presenter: SchedulesPresenter? { get set }
    func showSchedules()
}

protocol ScheduleViewable: class {
    var departureTime: String? { get set }
    var arrivalTime: String? { get set }
    var stops: String? { get set }
    var arrivalTerminal: String? { get set }
}
