//
//  ContentView.swift
//  Moonshot
//
//  Created by Ozan Barış Günaydın on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Image(.example)
            .resizable()
            .scaledToFit()
            .containerRelativeFrame(.horizontal) { size, axis in
                size * 0.8
            }
    }
}

#Preview {
    ContentView()
}
