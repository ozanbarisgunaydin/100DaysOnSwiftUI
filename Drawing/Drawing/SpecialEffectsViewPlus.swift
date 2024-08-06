//
//  SpecialEffectsViewPlus.swift
//  Drawing
//
//  Created by Ozan Barış Günaydın on 6.08.2024.
//

import SwiftUI

struct SpecialEffectsViewPlus: View {
    @State private var amount = 0.0
    
    var body: some View {
        VStack {
            Image("PaulHudson")
                .resizable()
                .scaledToFit()
                .frame(width: 200, height: 200)
                .saturation(amount)
                .blur(radius: (1 - amount) * 20)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffectsViewPlus()
}
