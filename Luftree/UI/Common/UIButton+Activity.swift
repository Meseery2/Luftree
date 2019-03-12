//
//  UIButton+Activity.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

protocol LoadableButton {
    func startLoading()
    func stopLoading()
}

extension UIButton: LoadableButton {
    private static var previousTitle: String?

    func startLoading() {
        let activityIndicator = UIActivityIndicatorView(frame: bounds)
        activityIndicator.color = .white
        activityIndicator.style = .white
        if let label = self.titleLabel {
            let padding = CGFloat(5.0)
            let height = label.frame.height - padding
            let width = height
            let frameX = label.frame.origin.x - (width + padding)
            let frameY = label.frame.origin.y +  ((label.frame.height - height) / 2.0)
            let frame = CGRect(x: frameX,
                               y: frameY,
                               width: width,
                               height: height)
            activityIndicator.frame = frame
        }
        addSubview(activityIndicator)
        bringSubviewToFront(activityIndicator)
        activityIndicator.startAnimating()
        UIButton.previousTitle = self.currentTitle
        setTitle("Loading ... ", for: .normal)
        isUserInteractionEnabled = false
    }

    func stopLoading() {
        if let activityView = subviews.first(where: {$0 is UIActivityIndicatorView }) as? UIActivityIndicatorView {
            activityView.stopAnimating()
            activityView.removeFromSuperview()
            setTitle(UIButton.previousTitle, for: .normal)
            isUserInteractionEnabled = true
        }
    }
}
