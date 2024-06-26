//
//  ContentView.swift
//  animations
//
//  Created by Ozan Barış Günaydın on 26.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingRed = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ContentView()
}
