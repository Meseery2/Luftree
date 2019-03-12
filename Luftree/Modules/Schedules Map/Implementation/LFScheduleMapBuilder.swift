//
//  ScheduleMapDefaultBuilder.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFScheduleMapBuilder {
    static func build(with schedule: Schedule) -> UIViewController? {
        guard let view = UIStoryboard
            .scheduleMapModuleStoryboard
            .instantiateView(LFScheduleMapViewController.self)
            else { return nil }
        let presenter = LFScheduleMapPresenter(schedule)
        let router = LFScheduleMapRouter()

        view.presenter = presenter

        presenter.view = view
        presenter.router = router

        router.presenter = presenter
        router.viewController = view

        return view
    }
}
