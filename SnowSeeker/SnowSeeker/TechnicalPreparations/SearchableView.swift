//
//  SearchableView.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

struct SearchableView: View {
    @State private var searchText = ""
    let allNames = ["Subg", "Vina", "Melvin", "Stefanie"]
    
    var filteredNames: [String] {
        if searchText.isEmpty {
            allNames
        } else {
            allNames.filter { name in
                name.localizedStandardContains(searchText)
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            List(filteredNames, id: \.self) { name in
                    Text(name)
            }
                .searchable(text: $searchText, prompt: "Look for something")
                .navigationTitle("Searching")
        }
    }
}

#Preview {
    SearchableView()
}
