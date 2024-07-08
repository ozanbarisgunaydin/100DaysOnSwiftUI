//
//  Location.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 8.07.2024.
//

import Foundation

struct Location: Codable, Equatable, Identifiable {
    let id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
}
