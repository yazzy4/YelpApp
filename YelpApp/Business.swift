//
//  Business.swift
//  YelpApp
//
//  Created by Yaz Burrell on 8/5/19.
//  Copyright © 2019 Yaz Burrell. All rights reserved.
//

import Foundation

struct BusinessSearch: Codable {
    let business: [Business]
}

struct Business: Codable {
    let id: String
    let alias: String
    let name: String
    let image_url: String
    let is_closed: Bool
    let url: String
    let review_count: Int
    let categories: [Categories]
    let coordinates: Coordinates
    let location: Location
}

struct Categories: Codable {
    let alias: String
    let title: String
}

struct Coordinates: Codable {
    let latitude: Double
    let longitude: Double
}

struct Location: Codable {
    let address1: String
    let address2: String
    let address3: String
    let city: String
    let zip_code: String
    let country: String
    let state: String
    let display_address: [Display_Address]

}

struct Display_Address: Codable {
    
}

