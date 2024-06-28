//
//  ContentView.swift
//  Moonshot
//
//  Created by Ozan Barış Günaydın on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
    var body: some View {
        Text("\(astronauts.count)")
    }
}

#Preview {
    ContentView()
}
