//
//  Card.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 30.07.2024.
//

import Foundation

struct Card: Codable {
    var prompt: String
    var answer: String
    
    static let example = Card(
        prompt: "Who played the 13th Doctor in Doctor Who?",
        answer: "Jodie Whittaker"
    )
}
