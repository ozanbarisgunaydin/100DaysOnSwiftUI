//
//  PathView.swift
//  Drawing
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

struct PathView: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 100))
            path.addLine(to: CGPoint(x: 100, y: 300))
            path.addLine(to: CGPoint(x: 300, y: 300))
            path.addLine(to: CGPoint(x: 200, y: 100))
        }
        
        .stroke(
            .blue,
            style: StrokeStyle(
                lineWidth: 20,
                lineCap: .round,
                lineJoin: .round
            )
        )
    }
}

#Preview {
    PathView()
}
