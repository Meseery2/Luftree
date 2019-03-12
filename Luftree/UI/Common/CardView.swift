//
//  UIView+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UIView

protocol CardViewStyle where Self: UIView {}

extension CardViewStyle {
    func applyCardStyle() {
        self.layer.cornerRadius = 15.0
        self.layer.borderColor  =  UIColor.clear.cgColor
        self.layer.borderWidth = 5.0
        self.layer.shadowOpacity = 0.5
        self.layer.shadowColor =  UIColor.lightGray.cgColor
        self.layer.shadowRadius = 5.0
        self.layer.shadowOffset = CGSize(width: 15,
                                         height: 15)
        self.layer.masksToBounds = true
    }
}

extension UIView: CardViewStyle {}
