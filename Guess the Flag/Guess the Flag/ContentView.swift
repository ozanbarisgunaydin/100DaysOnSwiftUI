//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Ozan Barış Günaydın on 14.06.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}


// MARK: - Glass Effect
//ZStack {
//    VStack(spacing: 0) {
//        Color.red
//        Color.blue
//    }
//    
//    Text("Your content")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.ultraThinMaterial)
//}
//.ignoresSafeArea()

// MARK: - Simple gradient
//LinearGradient(
//    colors: [
//        .red,
//        .blue
//    ],
//    startPoint: .top,
//    endPoint: .bottom
//)

// MARK: - Linear Stop Grandient
//LinearGradient(
//    stops: [
//        .init(color: .white, location: 0.45),
//        .init(color: .black, location: 0.55)
//    ],
//    startPoint: .top,
//    endPoint: .bottom
//)

// MARK: - Radial Gradient
//RadialGradient(
//    colors: [.blue, .red],
//    center: .center,
//    startRadius: 0,
//    endRadius: 150
//)
