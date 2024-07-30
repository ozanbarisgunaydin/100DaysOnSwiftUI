//
//  AccessibilitySettings.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 30.07.2024.
//

import SwiftUI

func withOptionalAnimation<Result>(
    _ animation: Animation? = .default,
    _ body: () throws -> Result
) rethrows -> Result {
    if UIAccessibility.isReduceMotionEnabled {
        return try body()
    } else {
        return try withAnimation(animation, body)
    }
}

struct AccessibilitySettings: View {
//    @Environment(\.accessibilityDifferentiateWithoutColor) var accessibilityDifferentiateWithoutColor
//    @Environment(\.accessibilityReduceMotion) var accessibilityReduceMotion
//    @State private var scale = 1.0
    @Environment(\.accessibilityReduceTransparency) var accessibilityReduceTransparency

    var body: some View {
//        HStack {
//            if accessibilityDifferentiateWithoutColor {
//                Image(systemName: "checkmark.circle")
//            }
//            
//            Text("Success")
//        }
//        .padding()
//        .background(accessibilityDifferentiateWithoutColor ? .black : .green)
//        .foregroundStyle(.white)
//        .clipShape(.capsule)
        
//        Button("Hello, world!") {
//            if accessibilityReduceMotion {
//                scale *= 1.5
//            } else {
//                withAnimation {
//                    scale *= 1.5
//                }
//            }
//            
//            withOptionalAnimation {
//                scale *= 1.5
//            }
//        }
//        .scaleEffect(scale)
        
        Text("Hello world")
            .padding()
            .background(accessibilityReduceTransparency ? Color.black : Color.black.opacity(0.5))
            .foregroundStyle(.white)
            .clipShape(.capsule)
    }
}

#Preview {
    AccessibilitySettings()
}
