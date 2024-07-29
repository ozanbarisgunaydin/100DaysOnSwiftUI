//
//  GestureView.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 29.07.2024.
//

import SwiftUI

struct GestureView: View {
    var body: some View {
        VStack {
            Text("Hello, world!")
                .onTapGesture {
                    print("⭕️ Text tapped")
                }
        }
        .highPriorityGesture(
            TapGesture()
                .onEnded {
                    print("⭕️ VStack tapped")
                    
                }
        )
    }
}

#Preview {
    GestureView()
}
