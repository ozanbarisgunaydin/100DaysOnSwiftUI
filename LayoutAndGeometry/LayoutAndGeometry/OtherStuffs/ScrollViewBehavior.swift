//
//  ScrollViewBehavior.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct ScrollViewBehavior: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<20) { number in
                    Text("Number \(number)")
                        .font(.largeTitle)
                        .padding()
                        .background(.red)
                        .frame(width: 200, height: 200)
                        .visualEffect { content, geometryProxy in
                            content
                                .rotation3DEffect(
                                    .degrees(-geometryProxy.frame(in: .global).minX / 8),
                                    axis: (x: 0.0, y: 1.0, z: 0.0)
                                )
                        }
                }
            }
            .scrollTargetLayout() /// Paging ** 1
        }
        .scrollTargetBehavior(.viewAligned) /// Paging ** 2
    }
}

#Preview {
    ScrollViewBehavior()
}
