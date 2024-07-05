//
//  ComporableView.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import SwiftUI

struct User: Comparable, Identifiable {
    // MARK: - Variables
    let firstName: String
    let lastName: String
    
    // MARK: - Identifiable
    let id = UUID()
    
    // MARK: - Comparable
    static func <(lhs: User, rhs: User) -> Bool {
        lhs.lastName < rhs.lastName
    }
}

struct ComporableView: View {
    let users = [
        User(firstName: "Arnold", lastName: "Rimmer"),
        User(firstName: "Kristine", lastName: "Kochanski"),
        User(firstName: "David", lastName: "Lister")
    ]
    /// Since it is `Comparable` we can use the .sorted() method directly.
    .sorted()
    
    var body: some View {
        /// Since the `User` model is `Identifiable` we not need to implement the `id: \.self` parameter in the List view.
        List(users) { user in
            Text("\(user.lastName), \(user.firstName)")
        }
    }
}

#Preview {
    ComporableView()
}
