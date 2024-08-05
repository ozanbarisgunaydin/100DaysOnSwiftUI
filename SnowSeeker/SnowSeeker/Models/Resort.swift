//
//  Resort.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    // MARK: - Variables
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    // MARK: - Constant
    /// Swift makes the parameters `lazy when we add `static let` propety on variables.
    static let allResorts: [Resort] = Bundle.main.decode("resort.json")
    static let example = allResorts[0]
}
