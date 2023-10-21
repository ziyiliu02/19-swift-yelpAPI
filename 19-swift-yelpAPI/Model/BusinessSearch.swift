//
//  BusinessSearch.swift
//  19-swift-yelpAPI
//
//  Created by Liu Ziyi on 21/10/23.
//

import Foundation

struct BusinessSearch: Decodable {
    var businesses = [Business]()
    var region = Region()
    var total = 0
}

struct Region: Decodable {
    var center: Coordinate?
}

struct Coordinate: Decodable {
    var latitude: Double?
    var longitude: Double?
}
