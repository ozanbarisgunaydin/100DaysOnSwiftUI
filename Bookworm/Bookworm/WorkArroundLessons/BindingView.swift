//
//  BindingView.swift
//  Bookworm
//
//  Created by Ozan Barış Günaydın on 3.07.2024.
//

import SwiftUI

struct BindingPushButton: View {
    let title: String
    
    /// `@State` make the isOn parameter is one way  changable.
    ///When we make it `@Binding` the isOn parameter effects the container view also.
    ///Then the `Text(rememberMe ? "On": "Off")` line is affected also.
    @Binding var isOn: Bool
    
    var onColors: [Color] = [.red, .yellow]
    var offColors: [Color] = [.init(white: 0.6), .init(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(
                colors: isOn ? onColors : offColors,
                startPoint: .top,
                endPoint: .bottom
            )
        )
        .foregroundStyle(.white)
        .clipShape(.capsule)
        .shadow(
            radius: isOn ? 0 : 5
        )
    }
}

struct BindingView: View {
    @State private var rememberMe = false
    
    var body: some View {
        VStack {
            BindingPushButton(title: "Remember Me", isOn: $rememberMe)
            Text(rememberMe ? "On": "Off")
        }
    }
}

#Preview {
    BindingView()
}
