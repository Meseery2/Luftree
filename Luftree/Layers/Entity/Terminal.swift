//
//  Terminal.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/11/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import Foundation

struct Terminal: Codable {
    let name: String?

    private enum CodingKeys: String, CodingKey {
        case name = "Name"
    }

    init(from decoder: Decoder) throws {
        let map = try decoder.container(keyedBy: CodingKeys.self)
        guard let name = try? map.decode(Int.self, forKey: .name) else {
            self.name = try? map.decode(String.self, forKey: .name)
            return
        }
        self.name = String(name)
    }

    init(name: String?) {
        self.name = name
    }
}
