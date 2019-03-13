//
//  AppDelegate.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        if let rootViewController = LFSearchModuleBuilder.build() {
            LFAppCoordinator
                .configureRootViewController(rootViewController: rootViewController, inWindow: window)
        }
        return true
    }
}
