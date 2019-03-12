//
//  LFSchedulesRouter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol SchedulesRouter {
    var presenter: SchedulesPresenter? { get set }
    func navigateToMap(with schedule: Schedule)
}
