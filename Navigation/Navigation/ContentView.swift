//
//  ContentView.swift
//  Navigation
//
//  Created by Ozan Barış Günaydın on 1.07.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var path = NavigationPath() /// Type eraser for navigation flows
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(0..<5) { i in
                    NavigationLink("Select Number: \(i)", value: i)
                }
                
                ForEach(0..<5) { i in
                    NavigationLink("Select String: \(i)", value: String(i))
                }
            }
            .toolbar {
                Button("Push 556") {
                    path.append(556)
                }
                Button("Push Hello") {
                    path.append("Hello")
                }
            }
            .navigationDestination(for: Int.self) { selection in
                Text("You selected the number \(selection)")
            }
            .navigationDestination(for: String.self) { selection in
                Text("You selected the text \(selection)")
            }
        }
    }
}

#Preview {
    ContentView()
}
