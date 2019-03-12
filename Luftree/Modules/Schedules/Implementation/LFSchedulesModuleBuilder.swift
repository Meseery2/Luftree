//
//  LFSchedulesModuleBuilder.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFSchedulesModuleBuilder {
    static func build(with schedules: [Schedule]) -> UIViewController? {
        guard let view = UIStoryboard
            .schedulesListModuleStoryboard
            .instantiateView(LFSchedulesListViewController.self)
            else { return nil }
        let presenter = LFSchedulesListPresenter()
        presenter.schedules = schedules

        let router = LFSchedulesListRouter()

        router.presenter = presenter
        view.presenter = presenter

        presenter.router = router

        presenter.view = view
        router.view = view

        return view
    }
}
