//
//  SearchDefaultRouter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFSearchRouter: SearchRouter {
    weak var presenter: SearchPresenter?
    weak var view: UIViewController?

    func navigateToSchedules(with schedules: [Schedule]) {
        guard let schedulesViewController = LFSchedulesModuleBuilder.build(with: schedules) else { return }
        view?
            .navigationController?
            .pushViewController(schedulesViewController,
                                animated: true)
    }
}
