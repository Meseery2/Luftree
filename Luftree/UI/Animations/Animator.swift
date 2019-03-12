//
//  Animator.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

protocol AnimatableListView {
     func isLastVisibleCell(at indexPath: IndexPath) -> Bool
}
protocol AnimatableCell where Self: UIView {}

extension UITableViewCell: AnimatableCell {}

final class Animator {
    private var hasAnimatedAllCells = false
    private let animation: Animation

    init(animation: @escaping Animation) {
        self.animation = animation
    }

    func animate(cell: AnimatableCell,
                 at indexPath: IndexPath,
                 in listView: AnimatableListView) {
        guard !hasAnimatedAllCells else {
            return
        }

        animation(cell, indexPath, listView)

        hasAnimatedAllCells = listView.isLastVisibleCell(at: indexPath)
    }
}

extension UITableView: AnimatableListView {
    func isLastVisibleCell(at indexPath: IndexPath) -> Bool {
        guard let lastIndexPath = indexPathsForVisibleRows?.last else {
            return false
        }

        return lastIndexPath == indexPath
    }
}
