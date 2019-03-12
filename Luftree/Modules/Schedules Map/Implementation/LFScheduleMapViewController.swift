//
//  ScheduleMapDefaultViewController.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit
import MapKit

class LFScheduleMapViewController: UIViewController {
    var presenter: ScheduleMapPresenter?
    @IBOutlet weak var scheduleMapView: MKMapView! {
        didSet {
            scheduleMapView.delegate = self
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = presenter?.viewTitle
        presenter?.viewDidLoad()
    }
}

extension LFScheduleMapViewController: ScheduleMapView {
    func showScheduleOnMap(_ coordinates: [[CLLocationCoordinate2D]]) {
        coordinates.forEach { (cord) in
            let line = MKGeodesicPolyline(coordinates: cord,
                                          count: 2)
            scheduleMapView.addOverlay(line)
        }
        scheduleMapView.setVisibleMapRect(MKMapRect.world, animated: true)
    }
}

extension LFScheduleMapViewController: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView,
                 rendererFor overlay: MKOverlay) -> MKOverlayRenderer {
        guard let polyline = overlay as? MKPolyline else {
            return MKOverlayRenderer()
        }

        let renderer = MKPolylineRenderer(polyline: polyline)
        renderer.lineWidth = 3.0
        renderer.alpha = 0.5
        renderer.lineDashPhase = 0.8
        renderer.strokeColor = UIColor.green
        return renderer
    }
}
