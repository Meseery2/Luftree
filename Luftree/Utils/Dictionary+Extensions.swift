//
//  Dictionary+Extensions.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

extension Dictionary {
    mutating func merge(dict: [Key: Value]?) {
        guard let dict = dict else {
            return
        }
        for (key, value) in dict {
            updateValue(value, forKey: key)
        }
    }
}
