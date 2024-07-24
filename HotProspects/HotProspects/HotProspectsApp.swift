//
//  HotProspectsApp.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 19.07.2024.
//

import SwiftData
import SwiftUI

@main
struct HotProspectsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Prospect.self)
    }
}
