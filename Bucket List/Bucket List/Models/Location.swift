//
//  Location.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 8.07.2024.
//

import Foundation
import MapKit

struct Location: Codable, Equatable, Identifiable {
    // MARK: - Identifiable
    var id: UUID /// Since the location name and desc can be edited UUID must be changed
    
    // MARK: - Parameters
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    // MARK: - Computed Properties
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(
            latitude: latitude,
            longitude: longitude
        )
    }
    
    // MARK: - Samples
#if DEBUG
    static let example = Location(
        id: UUID(),
        name: "Buckingham Palace",
        description: "Lit by over 40,000",
        latitude: 51.501476,
        longitude: -0.140634
    )
#endif
    
    // MARK: - Equatable
    static func ==(lhs: Location, rhs: Location) -> Bool {
        lhs.id == rhs.id
    }
}
