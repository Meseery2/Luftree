//
//  SearchDefaultPresenter.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import SearchTextField

class LFSearchPresenter: SearchPresenter {
    var router: SearchRouter?
    var interactor: SearchInteractor?
    weak var view: SearchViewController?

    var originAirport: LFAirport?
    var destinationAirport: LFAirport?

    var filteredAirports: [LFAirport]? {
        didSet {
            if let airports = filteredAirports {
                self.view?.reloadSearchSuggestions(with: airports.compactMap { SearchTextFieldItem.init($0)})
            }
        }
    }

    deinit {
        router = nil
        interactor = nil
    }
}

// MARK: - Setup Views Logic.
extension LFSearchPresenter {
    func setupSearchTextFields(_ searchTextFields: [SearchTextField?]) {
        _ = searchTextFields.map {
            $0?.comparisonOptions = [.caseInsensitive]
            $0?.maxNumberOfResults = 20
            $0?.minCharactersNumberToStartFiltering = 2
            $0?.startSuggestingInmediately = true
            $0?.theme.bgColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            $0?.theme.separatorColor = #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
            $0?.theme.cellHeight = 50
            $0?.theme.font = UIFont(name: "Avenir", size: 14.0) ?? .systemFont(ofSize: 14.0)
        }
    }

    func setupDatePicker(_ datePicker: UIDatePicker?) {
        datePicker?.minimumDate = Date()
        datePicker?.maximumDate = Date().addingTimeInterval(365*24*60*60)
    }
}

// MARK: - Views Actions.
extension LFSearchPresenter {
    func userDidSelectOrigin(_ origin: SearchableItem) {
        originAirport = filteredAirports?.first {
            $0.iata == origin.itemTitle
        }
    }

    func userDidSelectDestination(_ destination: SearchableItem) {
        destinationAirport = filteredAirports?.first {
            $0.iata == destination.itemTitle
        }
    }

    func userDidSearch(on date: Date,
                       isDirectFlight: Bool?) {
        view?.showLoadingView()
        guard let originAirport = originAirport,
            let destinationAirport = destinationAirport
            else { return }
        interactor?.searchSchedules(from: originAirport,
                                    to: destinationAirport,
                                    on: date,
                                    isDirectFlight: isDirectFlight,
                                    onCompletion: { [weak self] (result) in
                guard let `self` = self else { return }
                self.view?.hideLoadingView()
                if case let .success(schedules) = result {
                    guard let schedules = schedules else {
                        self.view?
                            .showError(NetworkError.invalidData)
                        return
                    }
                    self.router?
                        .navigateToSchedules(with: schedules)
                } else if case let .failure(error) = result {
                    self.view?.showError(error)
                }
        })
    }

    func searchAirports(for keyword: String?) {
        /// Validation Point
        guard let keyword = keyword,
            !keyword.isEmpty,
            keyword.count > 2 else {
                return
        }
        /// Interactor Point
        interactor?.searchAirports(keyword,
                                   onCompletion: { [weak self] (result) in
                                    guard let `self` = self else { return }
                                    if case let .success(airports) = result {
                                        self.filteredAirports = airports
                                    } else if case let .failure(error) = result {
                                        self
                                            .view?
                                            .showError(error)
                                    }
        })
    }
}

extension SearchTextFieldItem {
    convenience init(_ item: SearchableItem) {
        self.init(title: item.itemTitle,
                  subtitle: item.itemSubTitle)
    }
}
