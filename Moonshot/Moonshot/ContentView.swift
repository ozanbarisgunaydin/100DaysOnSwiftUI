//
//  ContentView.swift
//  Moonshot
//
//  Created by Ozan Barış Günaydın on 28.06.2024.
//

import SwiftUI

struct CustomText: View {
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(text: String) {
        print("Creating a new Custom Text")
        self.text = text
    }
}

struct ContentView: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) { /// Loads items if needed with `Lazy` but the size expands and it may create some UI issues
                ForEach(0..<100) {
                    CustomText(text: "Item of \($0)")
                        .font(.title)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
