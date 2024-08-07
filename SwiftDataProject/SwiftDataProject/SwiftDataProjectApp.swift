//
//  SwiftDataProjectApp.swift
//  SwiftDataProject
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import SwiftData
import SwiftUI

@main
struct SwiftDataProjectApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self) /// No need to Job addition since it is attached on the user.jobs object
    }
}
