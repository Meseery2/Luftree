//
//  LFAPIConstants.swift
//  Luftree
//
//  Created by Mohamed EL Meseery on 3/10/19.
//  Copyright © 2019 Meseery. All rights reserved.
//

import UIKit

enum LFAPIConstants {
    struct Auth {
        static let APIClientID = "3azwtxfebbqxk42259h9dusr"
        static let APIClientSecret = "bgdVuKzqHh"
        static let APIGrantType = "client_credentials"
    }
    static let APIBaseURL = "https://api.lufthansa.com/v1/"
    static let APIScheduleDateTimeFormat = "yyyy-MM-dd'T'HH:mm"
    static let APIInputDateTimeFormat = "yyyy-MM-dd"
}
