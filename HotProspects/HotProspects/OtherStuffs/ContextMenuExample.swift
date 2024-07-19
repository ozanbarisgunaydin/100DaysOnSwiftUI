//
//  ContextMenuExample.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 20.07.2024.
//

import SwiftUI

struct ContextMenuExample: View {
    @State private var backgroundColor = Color.red
    
    var body: some View {
        VStack {
            Text("Hello world!")
                .padding()
                .background(backgroundColor)
            
            Text("Change Color")
                .padding()
                .contextMenu {
                    Button("Red", systemImage: "checkmark.circle.fill", role: .destructive) {
                        backgroundColor = .red
                    }
                    
                    Button("Green") {
                        backgroundColor = .green
                    }
                    
                    Button("Blue") {
                        backgroundColor = .blue
                    }
                }
        }
    }
}

#Preview {
    ContextMenuExample()
}
