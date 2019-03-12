//
//  UITextField+Extension.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit.UITextField

extension UITextField {
    func setLeftText(_ text: String,
                     font: UIFont? = nil,
                     padding: CGFloat = 0) {
        setLeftView(textView(With: text,
                             font: font ?? self.font ?? .systemFont(ofSize: 14.0),
                             padding: padding))
    }

    func setRightText(_ text: String,
                      font: UIFont? = nil,
                      padding: CGFloat = 0) {

        setRightView(textView(With: text,
                              font: font ?? self.font ?? .systemFont(ofSize: 14.0),
                             padding: padding))
    }

    func setLeftView(_ view: UIView) {
        self.leftView = view
        self.leftViewMode = .always
    }

    func setRightView(_ view: UIView) {
        self.rightView = view
        self.rightViewMode = .always
    }

    func setLeftPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }

    func setRightPaddingPoints(_ amount: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: frame.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }

    private func textView(With text: String,
                          font: UIFont = .systemFont(ofSize: 14.0),
                          padding: CGFloat = 0.0) -> UIView {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let width = text.size(withAttributes: fontAttributes).width
        let textView = UIView(frame: CGRect(x: 0,
                                            y: 0,
                                            width: width + padding,
                                            height: frame.height))
        let label = UILabel(frame: CGRect(x: padding,
                                          y: 0,
                                          width: width,
                                          height: frame.height))
        label.text = text
        label.font = font
        label.textColor = .lightGray
        textView.addSubview(label)
        return textView
    }
}
