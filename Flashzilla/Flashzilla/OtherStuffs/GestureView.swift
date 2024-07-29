//
//  GestureView.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 29.07.2024.
//

import SwiftUI

struct GestureView: View {
    @State private var currentAmount = 0.0
    @State private var finalAmount = 1.0

    
    var body: some View {
        Text("Hello, world!")
            .scaleEffect(finalAmount + currentAmount)
            .gesture(
                MagnifyGesture()
                    .onChanged{ value in
                        currentAmount = value.magnification - 1
                    }
                    .onEnded { value in
                        finalAmount += currentAmount
                        currentAmount = 0
                    }
                )
    }
}

#Preview {
    GestureView()
}
