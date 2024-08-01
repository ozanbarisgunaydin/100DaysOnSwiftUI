//
//  ScrollViewGeometry.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct ScrollViewGeometry: View {
    let colors: [Color] = [
        .red,
        .green,
        .blue,
        .orange,
        .pink,
        .purple,
        .yellow
    ]
    
    var body: some View {
        GeometryReader { proxyFullView in
            ScrollView {
                ForEach(0..<50) { index in
                    GeometryReader { proxy in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
                            .background(colors[index % 7])
                            .rotation3DEffect(
                                .degrees(proxy.frame(in: .global).minY - proxyFullView.size.height / 2) / 5,
                                axis: (x: 0, y: 1, z: 0)
                            )
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ScrollViewGeometry()
}
