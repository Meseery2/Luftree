//
//  LFSchedulesPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol SchedulesPresenter: class {
    var router: SchedulesRouter? { get set }
    var view: SchedulesView? { get set }
    var schedulesCount: Int { get }
    var viewTitle: String { get }

    func viewDidLoad()
    func configScheduleView(_ view: ScheduleViewable,
                            at indexPath: IndexPath)
    func userDidSelectSchedule(at indexPath: IndexPath)
}
