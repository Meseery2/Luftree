//
//  LFSchedulesDefaultRouter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFSchedulesListRouter: SchedulesRouter {
    weak var presenter: SchedulesPresenter?
    weak var view: UIViewController?
}

extension LFSchedulesListRouter {
    func navigateToMap(with schedule: Schedule) {
        guard let scheduleMapViewController = LFScheduleMapBuilder.build(with: schedule)
            else { return }
        view?
            .navigationController?
            .pushViewController(scheduleMapViewController,
                                animated: true)
    }
}
