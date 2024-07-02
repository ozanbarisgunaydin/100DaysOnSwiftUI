//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ozan Barış Günaydın on 2.07.2024.
//

import Foundation

@Observable
class Order {
    static let types = ["Vanilla", "Strawberry", "Chocolatte", "Rainbow"]
    
    var type = 0
    var quantity = 3
    
    var specialRequestEnabled = false {
        didSet {
            if !specialRequestEnabled {
                extraFrosting = false
                addSprinkles = false
            }
        }
    }
    var extraFrosting = false
    var addSprinkles = false
    
    var name = ""
    var streetAddress = ""
    var city = ""
    var zip = ""
    
    var hasValidAddress: Bool {
        if name.isEmpty || streetAddress.isEmpty || city.isEmpty || zip.isEmpty {
            return false
        }
        
        return true
    }
}
