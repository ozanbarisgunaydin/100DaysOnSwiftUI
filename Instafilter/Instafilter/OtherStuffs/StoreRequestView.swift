//
//  StoreRequestView.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import StoreKit
import SwiftUI

struct StoreRequestView: View {
    @Environment(\.requestReview) var requestReview
    
    var body: some View {
        Button("Leave a Review") {
            requestReview()
        }
    }
}

#Preview {
    StoreRequestView()
}
