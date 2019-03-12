//
//  LFAppCordinator.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

protocol AppCoordinator {
    static func configureRootViewController(
                rootViewController: UIViewController,
                inWindow window: UIWindow?)
}

final public class LFAppCoordinator: AppCoordinator {
    static func configureRootViewController(
                rootViewController: UIViewController,
                inWindow window: UIWindow?) {
                window?.rootViewController = rootViewController
                window?.makeKeyAndVisible()
    }
}
