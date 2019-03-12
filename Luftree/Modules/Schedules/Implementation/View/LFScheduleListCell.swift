//
//  LFScheduleListCell.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFScheduleListCell: UITableViewCell {
    @IBOutlet weak var departureTimeLabel: UILabel?
    @IBOutlet weak var arrivalTimeLabel: UILabel?
    @IBOutlet weak var stopsLabel: UILabel?
    @IBOutlet weak var terminalLabel: UILabel?

    @IBOutlet weak var containerView: UIView! {
        didSet {
            self.backgroundColor = .clear
            containerView.applyCardStyle()
        }
    }

    override func didMoveToSuperview() {
        super.didMoveToSuperview()
        setup()
    }

    func setup() {
        self.accessoryType = .disclosureIndicator
        self.selectionStyle = .none
    }
}

extension LFScheduleListCell: ScheduleViewable {
    var departureTime: String? {
        get {
            return departureTimeLabel?.text
        }
        set {
            departureTimeLabel?.text = newValue
        }
    }

    var arrivalTime: String? {
        get {
            return arrivalTimeLabel?.text
        }
        set {
            arrivalTimeLabel?.text = newValue
        }
    }

    var stops: String? {
        get {
            return stopsLabel?.text
        }
        set {
            stopsLabel?.text = newValue
        }
    }

    var arrivalTerminal: String? {
        get {
            return terminalLabel?.text
        }
        set {
            terminalLabel?.text = newValue
        }
    }
}
