//
//  GestureView.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 29.07.2024.
//

import SwiftUI

struct GestureView: View {
    @State private var currentAmount = Angle.zero
    @State private var finalAmount = Angle.zero

    
    var body: some View {
        Text("Hello, world!")
            .rotationEffect(finalAmount + currentAmount)
            .gesture(
                RotateGesture()
                    .onChanged { value in
                        currentAmount = value.rotation
                    }
                    .onEnded { value in
                            finalAmount += currentAmount
                        currentAmount = .zero
                    }
                )
    }
}

#Preview {
    GestureView()
}
