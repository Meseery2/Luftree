//
//  UIstoryboard+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

extension UIStoryboard {
    static var searchModuleStoryboard: UIStoryboard {
        return UIStoryboard(name: "SearchModule", bundle: nil)
    }

    static var schedulesListModuleStoryboard: UIStoryboard {
        return UIStoryboard(name: "SchedulesListModule", bundle: nil)
    }

    static var scheduleMapModuleStoryboard: UIStoryboard {
        return UIStoryboard(name: "ScheduleMapModule", bundle: nil)
    }

    public func instantiateView<T>(_ type: T.Type) -> T? where T: UIViewController {
        if let view = instantiateViewController(withIdentifier: type.identifier) as? T {
            return view
        } else {
            return nil
        }
    }
}
