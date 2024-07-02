//
//  ObservableCodable.swift
//  CupcakeCorner
//
//  Created by Ozan Barış Günaydın on 2.07.2024.
//

import SwiftUI

@Observable
class User: Codable {
    var name = "Taylor"
    
    enum CodingKeys: String, CodingKey {
        case _name = "name"
    }
}

struct ObservableCodable: View {
    var body: some View {
        Button("Encode Taylor", action: encodeTaylor)
    }
    
    func encodeTaylor() {
        let data = try! JSONEncoder().encode(User())
        let str = String(decoding: data, as: UTF8.self)
        print("⭕️ \(str)")
    }
}

#Preview {
    ObservableCodable()
}
