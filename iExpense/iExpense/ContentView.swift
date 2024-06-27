//
//  ContentView.swift
//  iExpense
//
//  Created by Ozan Barış Günaydın on 27.06.2024.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap Count: \(tapCount)") {
            tapCount += 1
        }
    }
}

#Preview {
    ContentView()
}
