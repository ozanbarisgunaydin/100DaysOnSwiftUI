//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .background(.red)
            .padding(20)
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.blue, lineWidth: 2)
            }
    }
}

#Preview {
    ContentView()
}
