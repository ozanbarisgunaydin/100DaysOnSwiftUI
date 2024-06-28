//
//  ContentView.swift
//  Moonshot
//
//  Created by Ozan Barış Günaydın on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    let layout = [
        GridItem(.adaptive(minimum: 80, maximum: 120))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout, content: {
                ForEach(0..<1000) {
                    Text("Item \($0)")
                    
                }
            })
        }

        ScrollView {
            LazyVGrid(columns: layout, content: {
                ForEach(0..<1000) {
                    Text("Item \($0)")

                }
            })
        }
    }
}

#Preview {
    ContentView()
}
