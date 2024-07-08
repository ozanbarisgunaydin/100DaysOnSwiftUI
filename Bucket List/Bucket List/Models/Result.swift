//
//  Result.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 8.07.2024.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable {
    let pageid: Int
    let title: String
    let terms: [String: [String]]?
}
