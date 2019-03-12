//
//  ErrorViewLoadable.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UIViewController

protocol ErrorViewLoadable {
    func showError(_ error: Error)
}

extension ErrorViewLoadable where Self: UIViewController {
    func showError(_ error: Error) {
        showAlert(title: LFScheduleViewConstants.kErrorViewTitle,
                  message: error.localizedDescription,
                  dismissAfter: 5)
    }
}
