//
//  ObservableEnvironmentView.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

@Observable
class Player {
    var name = "Anonymous"
    var highScore = 0
}

struct HighScoreView: View {
    @Environment(Player.self) var player
    
    var body: some View {
        @Bindable var player = player
        
        Stepper("High score: \(player.highScore)", value: $player.highScore)
    }
}

struct ObservableEnvironmentView: View {
    @State private var player = Player()
    
    var body: some View {
        VStack {
            Text("Welcome")
            HighScoreView()
        }
        .environment(player)
    }
}

#Preview {
    ObservableEnvironmentView()
}
