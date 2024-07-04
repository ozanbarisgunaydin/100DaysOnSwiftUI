//
//  PropertyWrapperStructs.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 4.07.2024.
//

import SwiftUI

struct PropertyWrapperStructs: View {
    @State private var blurAmount = 0.0
    
    var body: some View {
        VStack {
            Text("Hello, world!")
                .blur(radius: blurAmount)
            
            /// Changes property value then the didSet of the blurAmount is triggered:
            /// Button("Random Blur") {
            ///     blurAmount = Double.random(in: 0...20)
            /// }
            ///
            /// Only changes the current value not the wrapper value for fetching the changes we need to fetch the onChange block
            Slider(value: $blurAmount, in: 0...20)
        }
        .onChange(of: blurAmount) { oldValue, newValue in
            print("⭕️ \(newValue)")
        }
    }
}

#Preview {
    PropertyWrapperStructs()
}
