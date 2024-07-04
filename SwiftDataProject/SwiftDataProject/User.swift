//
//  User.swift
//  SwiftDataProject
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import Foundation
import SwiftData

@Model
class User {
    var name: String
    var city: String
    var joinDate: Date
    /// Makes `Migration`
    ///
    /// @Relationship(deleteRule: .cascade) .... handles the removing jobs when the user is deleted.
    @Relationship(deleteRule: .cascade) var jobs: [Job] = []

    init(
        name: String,
        city: String,
        joinDate: Date
    ) {
        self.name = name
        self.city = city
        self.joinDate = joinDate
    }
}
