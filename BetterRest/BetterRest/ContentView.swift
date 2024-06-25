//
//  ContentView.swift
//  BetterRest
//
//  Created by Ozan Barış Günaydın on 25.06.2024.
//

import SwiftUI

struct ContentView: View {    
    var body: some View {
        Text(Date.now.formatted(date: .long, time: .shortened))
    }
}

#Preview {
    ContentView()
}
