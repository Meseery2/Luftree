//
//  SearchRouter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UIViewController

protocol SearchRouter {
    var presenter: SearchPresenter? { get set }
    var view: UIViewController? { get set }
    func navigateToSchedules(with schedules: [Schedule])
}
