//
//  SearchViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import SearchTextField

protocol SearchViewController: class, ErrorViewLoadable {
    var presenter: SearchPresenter? { get set }
    func showLoadingView()
    func hideLoadingView()
    func reloadSearchSuggestions(with newSuggestions: [SearchTextFieldItem])
}
