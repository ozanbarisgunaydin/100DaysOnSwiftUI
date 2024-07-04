//
//  EmptyStateView.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import SwiftUI

struct EmptyStateView: View {
    @State private var showCodeSnippet = false
    @State private var snippetTitle = ""
    
    var body: some View {
        ContentUnavailableView {
            Label("No snippets", systemImage: "swift")
        } description: {
            Text("You don't have any saved snippets yet.")
        } actions: {
            Button("Please add new snippet", systemImage: "plus") {
                showCodeSnippet.toggle()
            }
            .foregroundColor(.secondary)
        }
        .alert("Thank you!", isPresented: $showCodeSnippet) {
            Button("Ok") { }
        }
    }
}

#Preview {
    EmptyStateView()
}
