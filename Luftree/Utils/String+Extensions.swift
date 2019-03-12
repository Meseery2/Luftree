//
//  String+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

extension String {
    func scheduleTime() -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = LFAPIConstants.APIScheduleDateTimeFormat
        return dateFormatter.date(from: self)
    }

    func slice(fromString: String,
               toString: String) -> String? {
        return (range(of: fromString)?.upperBound).flatMap { substringFrom in
            (range(of: toString, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
