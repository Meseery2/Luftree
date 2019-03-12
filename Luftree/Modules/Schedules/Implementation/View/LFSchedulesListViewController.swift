//
//  LFSchedulesDefaultViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

typealias SchdeuleViewCell = ScheduleViewable & UITableViewCell

class LFSchedulesListViewController: UIViewController {
    @IBOutlet dynamic weak var schedulesListTable: UITableView? {
        didSet {
            schedulesListTable?.dataSource = self
            schedulesListTable?.delegate = self
            schedulesListTable?.register(
                UINib.scheduleListCell,
                forCellReuseIdentifier: LFScheduleListCell.identifier)
        }
    }

    var presenter: SchedulesPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = presenter?.viewTitle
        presenter?.viewDidLoad()
    }
}

extension LFSchedulesListViewController: SchedulesView {
    func showSchedules() {
        schedulesListTable?.reloadData()
    }
}

extension LFSchedulesListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.presenter?.schedulesCount ?? 0
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView
            .dequeueReusableCell(withIdentifier: LFScheduleListCell.identifier)
            as? SchdeuleViewCell else {
            fatalError("Schedule cell must conform to: `ScheduleViewable` Protocol")
        }
        presenter?.configScheduleView(cell, at: indexPath)
        return cell
    }
}

extension LFSchedulesListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let animation = AnimationFactory.makeMoveUpWithFade(rowHeight: 80.0, duration: 0.8, delayFactor: 0.08)
        let animator = Animator(animation: animation)
        animator.animate(cell: cell, at: indexPath, in: tableView)
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?
            .userDidSelectSchedule(at: indexPath)
    }

    func tableView(_ tableView: UITableView,
                   viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        headerView.backgroundColor = .clear
        return headerView
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return CGFloat(LFScheduleViewConstants.kScheduleCellVerticalMargins)
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(LFScheduleViewConstants.kScheduleCellHeight)
    }
}
