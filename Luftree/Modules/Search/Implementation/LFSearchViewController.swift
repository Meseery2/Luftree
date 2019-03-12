//
//  SearchDefaultViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import SearchTextField

class LFSearchViewController: UIViewController {
    @IBOutlet weak var originTextField: SearchTextField? {
        didSet {
            originTextField?.itemSelectionHandler = { [weak self] items, idx in
                guard let `self` = self else { return }
                let item = items[idx]
                self.originTextField?.text = item.title
                self.presenter?.userDidSelectOrigin(item)
            }
            originTextField?.setLeftText("From:", padding: 5.0)
        }
    }

    @IBOutlet weak var destinationTextField: SearchTextField? {
        didSet {
            destinationTextField?.itemSelectionHandler = { [weak self] items, idx in
                guard let `self` = self else { return }
                let item = items[idx]
                self.destinationTextField?.text = item.title
                self.presenter?.userDidSelectDestination(item)
            }
            destinationTextField?.setLeftText("To:", padding: 5.0)
        }
    }

    @IBOutlet weak var datePicker: UIDatePicker?
    @IBOutlet weak var isDirectFlightSwitch: UISwitch?
    @IBOutlet weak var searchButton: UIButton? {
        didSet {
            searchButton?.layer.cornerRadius = 12.0
            searchButton?.backgroundColor = #colorLiteral(red: 0.9421710372, green: 0.44198066, blue: 0.2586857677, alpha: 1)
        }
    }

    var presenter: SearchPresenter?

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.setupSearchTextFields([originTextField, destinationTextField])
        presenter?.setupDatePicker(datePicker)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    @IBAction func didSearch(_ sender: UIButton) {
        presenter?.userDidSearch(on: datePicker?.date ?? Date(), isDirectFlight: isDirectFlightSwitch?.isOn)
    }

    @IBAction func textFieldDidChange(_ textField: UITextField) {
        presenter?.searchAirports(for: textField.text)
    }
}

extension LFSearchViewController: SearchViewController {
    func reloadSearchSuggestions(with newSuggestions: [SearchTextFieldItem]) {
        if let active = originTextField?.isEditing, active {
            originTextField?.filterItems(newSuggestions)
        } else {
            destinationTextField?.filterItems(newSuggestions)
        }
    }

    func showLoadingView() {
        searchButton?.startLoading()
    }

    func hideLoadingView() {
        searchButton?.stopLoading()
    }
}

extension SearchTextFieldItem: SearchableItem {
    var itemTitle: String {
        return self.title
    }
    var itemSubTitle: String? {
        return self.subtitle
    }
}
