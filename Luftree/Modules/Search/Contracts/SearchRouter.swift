//
//  SearchRouter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol SearchRouter {
    var presenter: SearchPresenter? { get set }
    func navigateToSchedules(with schedules: [Schedule])
}
