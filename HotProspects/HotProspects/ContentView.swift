//
//  ContentView.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 19.07.2024.
//

import SwiftUI

struct ContentView: View {
    let users = ["Tohru", "Yuki", "Kyo", "Momiji"]
    @State private var selection = Set<String>()

    var body: some View {
        List(users, id: \.self, selection: $selection) { user in
                Text(user)
        }
        
        if !selection.isEmpty {
            Text("You selected \(selection.formatted())")
        }
        
        EditButton()
    }
}

#Preview {
    ContentView()
}