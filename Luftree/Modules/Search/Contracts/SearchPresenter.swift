//
//  SearchPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import SearchTextField
import UIKit.UIDatePicker

protocol SearchPresenter: class {
    var router: SearchRouter? { get set }
    var interactor: SearchInteractor? { get set }
    var view: SearchViewController? { get set }

    func setupSearchTextFields(_ searchTextFields: [SearchTextField?])
    func setupDatePicker(_ datePicker: UIDatePicker?)
    func searchAirports(for keyword: String?)
    func userDidSelectOrigin(_ origin: SearchableItem)
    func userDidSelectDestination(_ destination: SearchableItem)
    func userDidSearch(on date: Date,
                       isDirectFlight: Bool?)
}
