//
//  Date+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

extension Date {
    func scheduleStringRepresentation() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = LFAPIConstants.APIInputDateTimeFormat
        return dateFormatter.string(from: self)
    }

    func timeRepresentaion() -> String {
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: self)
        let minutes = calendar.component(.minute, from: self)
        return "\(hour < 10 ? "0" : "")\(hour):\(minutes < 10 ? "0" : "")\(minutes)"
    }
}
