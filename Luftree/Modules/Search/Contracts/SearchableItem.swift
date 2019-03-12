//
//  SearchableItem.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

protocol SearchableItem {
    var itemTitle: String { get }
    var itemSubTitle: String? { get }
}

extension LFAirport: SearchableItem {
    var itemTitle: String {
        return self.iata
    }

    var itemSubTitle: String? {
        return self.name
    }
}
