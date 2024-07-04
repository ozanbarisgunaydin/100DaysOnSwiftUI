//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(
        filter: #Predicate<User> { user in
            user.name.localizedStandardContains("R") && /// `localizedStandardContains` counts the small "r" also
            user.city == "London"
        },
        sort: \User.name
    ) var users: [User] = []
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(value: user) {
                    Text(user.name)
                }
            }
            .navigationTitle("Users")
            .toolbar {
                Button("Add Samples", systemImage: "plus") {
                    try? modelContext.delete(model: User.self)
                    
                    let firstUser = User(
                        name: "Ed Sheeron",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -10)
                    )
                    let secondUser = User(
                        name: "Rosa Diaz",
                        city: "New York",
                        joinDate: .now.addingTimeInterval(86400 * -5)
                    )
                    let thirdUser = User(
                        name: "Roy Kent",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * -5)
                    )
                    let fourthUser = User(
                        name: "Johnny English",
                        city: "London",
                        joinDate: .now.addingTimeInterval(86400 * 10)
                    )
                    
                    modelContext.insert(firstUser)
                    modelContext.insert(secondUser)
                    modelContext.insert(thirdUser)
                    modelContext.insert(fourthUser)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
