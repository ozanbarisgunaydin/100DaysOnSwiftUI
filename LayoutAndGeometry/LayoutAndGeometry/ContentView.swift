//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 1.08.2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading) {
            ForEach(0..<10) { position in
                    Text("Number \(position)")
                    .alignmentGuide(.leading) { dimension in
                        Double(position) * -10
                    }
            }
        }
        .background(.red)
        .frame(width: 400, height: 400)
        .background(.blue)
    }
}

#Preview {
    ContentView()
}
