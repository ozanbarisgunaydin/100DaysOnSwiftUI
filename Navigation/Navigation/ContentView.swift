//
//  ContentView.swift
//  Navigation
//
//  Created by Ozan Barış Günaydın on 1.07.2024.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    
    var body: some View {
        Text("Detail View \(number)")
    }
    
    init(number: Int) {
        self.number = number
        print("⭕️ Creating detail view \(number)")
    }
}

struct ContentView: View {
    var body: some View {
        NavigationStack {
            NavigationLink("Tap Me") {
                /// Automatically create the detail view on the content view's creating
                DetailView(number: 556)
            }
        }
    }
}

#Preview {
    ContentView()
}
