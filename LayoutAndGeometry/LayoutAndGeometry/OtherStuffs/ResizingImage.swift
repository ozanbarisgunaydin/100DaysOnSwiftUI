//
//  ResizingImage.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct ResizingImage: View {
    var body: some View {
        HStack {
            Text("IMPORTANT")
                .frame(width: 200)
                .background(.blue)
            
            GeometryReader { proxy in
                Image(.example)
                    .resizable()
                    .scaledToFit()
                    .frame(width: proxy.size.width * 0.8)
                    .frame(width: proxy.size.width, height: proxy.size.height)
            }
        }
    }
}

#Preview {
    ResizingImage()
}
