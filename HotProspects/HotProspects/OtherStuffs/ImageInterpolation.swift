//
//  ImageInterpolation.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 20.07.2024.
//

import SwiftUI

struct ImageInterpolation: View {
    var body: some View {
        Image(.example)
            .interpolation(.none) /// removes the smoothing
            .resizable()
            .scaledToFit()
            .background(.black)
    }
}

#Preview {
    ImageInterpolation()
}
