//
//  LFAirport.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import CoreLocation.CLLocation

struct LFAirport: Codable {
    let name: String
    let iata: String
    let city: String
    let lat: String
    let lon: String

    init(name: String,
         iata: String,
         city: String,
         lat: String,
         lon: String) {
        self.name = name
        self.iata = iata
        self.city = city
        self.lat = lat
        self.lon = lon
    }
}

extension LFAirport {
    var coordinates: CLLocationCoordinate2D? {
        guard let lat = Double(lat), let long = Double(lon) else { return nil }
        return CLLocationCoordinate2D(latitude: lat,
                                      longitude: long)
    }
}
