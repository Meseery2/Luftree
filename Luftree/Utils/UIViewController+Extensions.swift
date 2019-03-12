//
//  UIViewController+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UIViewController

extension UIViewController {
    public func showAlert(title: String,
                          message: String,
                          dismissAfter seconds: Int? = nil) {
        let alertViewController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        present(alertViewController, animated: true)
        if let seconds = seconds {
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds)) {
                alertViewController.dismiss(animated: true)
            }
        }
    }
}
