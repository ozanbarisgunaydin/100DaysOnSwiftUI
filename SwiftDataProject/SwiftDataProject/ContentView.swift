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
    @State private var showingUpcomingOnly = false
    @State private var sortOrder = [
        SortDescriptor(\User.name),
        SortDescriptor(\User.joinDate)
    ]

    var body: some View {
        NavigationStack {
            UsersView(
                minimumJoinDate: showingUpcomingOnly ? .now : .distantPast,
                sortOrder: sortOrder
            )
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
                Button(showingUpcomingOnly ? "Show everyone" : "Show Upcoming") {
                    showingUpcomingOnly.toggle()
                }
                
                Menu("Sort", systemImage: "arrow.up.arrow.down") {
                    
                    Picker("Sort", selection: $sortOrder) {
                        Text("Sort by Name")
                            .tag([
                                SortDescriptor(\User.name),
                                SortDescriptor(\User.joinDate)
                            ])
                        Text("Sort by Join Date")
                            .tag([
                                SortDescriptor(\User.joinDate),
                                SortDescriptor(\User.name)
                            ])
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
