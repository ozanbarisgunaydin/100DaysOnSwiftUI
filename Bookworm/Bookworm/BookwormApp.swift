//
//  BookwormApp.swift
//  Bookworm
//
//  Created by Ozan Barış Günaydın on 3.07.2024.
//

import SwiftData
import SwiftUI

@main
struct BookwormApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Book.self)
    }
}
