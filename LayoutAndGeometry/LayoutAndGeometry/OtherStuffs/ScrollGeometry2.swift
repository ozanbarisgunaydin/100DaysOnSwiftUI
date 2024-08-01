//
//  ScrollGeometry2.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct ScrollGeometry2: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 0) {
                ForEach(0..<20) { number in
                    GeometryReader { proxy in
                        Text("Number \(number)")
                            .font(.largeTitle)
                            .padding()
                            .background(.red)
                            .rotation3DEffect(
                                .degrees(-proxy.frame(in: .global).minX),
                            axis: (x: 0.0, y: 1.0, z: 0.0)
                            )
                            .frame(width: 200, height: 200)
                    }
                    .frame(width: 200, height: 200)
                }
            }
        }
    }
}

#Preview {
    ScrollGeometry2()
}
