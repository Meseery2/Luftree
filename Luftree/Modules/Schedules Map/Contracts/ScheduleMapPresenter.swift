//
//  ScheduleMapPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol ScheduleMapPresenter: class {
    var router: ScheduleMapRouter? { get set }
    var view: ScheduleMapView? { get set }
    var viewTitle: String? { get }
    var schedule: Schedule { get }

    func viewDidLoad()
}
