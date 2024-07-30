//
//  BackgroundForeground.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 30.07.2024.
//

import SwiftUI

struct BackgroundForeground: View {
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        Text("Hello, World!")
            .onChange(of: scenePhase) { oldPhase, newPhase in
                if newPhase == .active {
                    print("⭕️ active")
                } else if newPhase == .inactive {
                    print("⭕️ inactive")
                } else if newPhase == .background {
                    print("⭕️ background")
                }
            }
    }
}

#Preview {
    BackgroundForeground()
}
