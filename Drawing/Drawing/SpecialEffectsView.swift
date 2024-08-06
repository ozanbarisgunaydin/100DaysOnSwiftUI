//
//  SpecialEffectsView.swift
//  Drawing
//
//  Created by Ozan Barış Günaydın on 6.08.2024.
//

import SwiftUI

struct SpecialEffectsView: View {
    @State private var amount = 100.0
    
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Image("PaulHudson")
                Rectangle()
                    .fill(.red)
                    .blendMode(.multiply)
                /* alternative
                 Image("PaulHudson").colorMultiply(.red)
                 */
            }
            .frame(width: 200, height: 200)
            .clipped()


            Spacer()
            Divider()
            Spacer()

            ZStack {
                /// `.fill(Color(red: 0, green: 1, blue: 0))` -> gives exact colors then the middle gonna be real white
                /// Color.red not give this.
                Circle()
                    .fill(Color(red: 1, green: 0, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: -50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 1, blue: 0))
                    .frame(width: 200 * amount)
                    .offset(x: 50, y: -80)
                    .blendMode(.screen)
                
                Circle()
                    .fill(Color(red: 0, green: 0, blue: 1))
                    .frame(width: 200 * amount)
                    .blendMode(.screen)
            }
            .frame(width: 300, height: 300)
            
            Slider(value: $amount)
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffectsView()
}
