//
//  SearchDefaultBuilder.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

class LFSearchModuleBuilder {
    static func build () -> UIViewController? {
        guard let view = UIStoryboard
            .searchModuleStoryboard
            .instantiateView(LFSearchViewController.self)
            else { return nil }
        let interactor = LFSearchInteractor()
        let presenter = LFSearchPresenter()
        let router = LFSearchRouter()

        view.presenter = presenter
        interactor.presenter = presenter
        router.presenter = presenter

        presenter.interactor = interactor
        presenter.router = router

        presenter.view = view
        router.view = view

        return UINavigationController(rootViewController: view)
    }
}
