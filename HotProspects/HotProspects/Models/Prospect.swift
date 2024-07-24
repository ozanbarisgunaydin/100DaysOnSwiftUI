//
//  Prospect.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 24.07.2024.
//

import SwiftData

@Model
class Prospect {
    var name: String
    var emailAddress: String
    var isContacted: Bool
    
    init(
        name: String,
        emailAddress: String,
        isContacted: Bool
    ) {
        self.name = name
        self.emailAddress = emailAddress
        self.isContacted = isContacted
    }
}
