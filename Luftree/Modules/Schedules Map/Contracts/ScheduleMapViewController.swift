//
//  ScheduleMapViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import CoreLocation.CLLocation

protocol ScheduleMapView: class {
    var presenter: ScheduleMapPresenter? { get set }
    func showScheduleOnMap(_ coordinates: [[CLLocationCoordinate2D]])
}
