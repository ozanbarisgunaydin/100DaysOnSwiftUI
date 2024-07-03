//
//  Order.swift
//  CupcakeCorner
//
//  Created by Ozan Barış Günaydın on 2.07.2024.
//

import Foundation

@Observable
class Order: Codable {
    
    enum CodingKeys: String, CodingKey {
        case _type = "type"
        case _quantity = "quantity"
        case _specialRequestEnabled = "specialRequestEnabled"
        case _extraFrosting = "extraFrosting"
        case _addSprinkles = "addSprinkles"
        case _name = "name"
        case _streetAddress = "streetAddress"
        case _city = "city"
        case _zip = "zip"
    }
    
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
    
    var cost: Decimal { /// Decimal is great for money
        /// $2 per cake
        var cost = Decimal(quantity) * 2
        
        /// Complicated Cakes
        cost += Decimal(type) / 2
        
        /// $1 per cake for extra frosting
        if extraFrosting {
            cost += Decimal(quantity)
        }
        
        /// $0.5 per cake for extra sprinkles
        if extraFrosting {
            cost += Decimal(quantity) / 2
        }
        return cost
    }
}
