//
//  ViewIdentifiable.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UITableViewCell

protocol ViewIdentifiable {
    static var identifier: String { get }
}

extension ViewIdentifiable {
    static var identifier: String {
        return String(describing: self)
    }
}

extension UIViewController: ViewIdentifiable {}
extension UITableViewCell: ViewIdentifiable {}
