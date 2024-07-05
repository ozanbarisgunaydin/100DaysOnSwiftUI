//
//  GradientBorder.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import SwiftUI

struct GradientBorder: ViewModifier {
    var cornerRadius: CGFloat
    var lineWidth: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(
                        LinearGradient(
                            colors: [.red, .blue],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: lineWidth
                    )
            )
    }
}

extension View {
    func gradientBorder(cornerRadius: CGFloat = 16, lineWidth: CGFloat = 4) -> some View {
        self.modifier(GradientBorder(cornerRadius: cornerRadius, lineWidth: lineWidth))
    }
}
