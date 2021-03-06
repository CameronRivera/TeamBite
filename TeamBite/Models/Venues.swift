//
//  Venue.swift
//  TeamBite
//
//  Created by Christian Hurtado on 4/20/20.
//  Copyright © 2020 Christian Hurtado. All rights reserved.
//

import Foundation

struct Venue: Codable {
    let name: String
    let venueId: String
    let longitude: String?
    let latitude: String?
    let phoneNumber: String?
    let address: String?
    let startTime: String?
    let endTime: String?
}
