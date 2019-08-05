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
}
