//
//  HitTestingView.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 30.07.2024.
//

import SwiftUI

struct HitTestingView: View {
    var body: some View {
        ZStack {
            Rectangle()
                .fill(.blue)
                .frame(width: 300, height: 300)
                .onTapGesture {
                    print("⭕️ Rectangle Tapped")
                }
            
            Circle()
                .fill(.red)
                .frame(width: 300, height: 300)
                .contentShape(.rect)
                .onTapGesture {
                    print("⭕️ Circle Tapped")
                }
//                .allowsHitTesting(false) /// Disables gesture interaction and transfer it background
        }
        
//        VStack {
//            Text("Hello")
//            Spacer()
//                .frame(height: 100)
//            
//            Text("World")
//        }
//        .contentShape(.rect) /// Adds the spaces also for gesture
//        .onTapGesture {
//            print("⭕️ VStack tapped")
//        }
    }
}

#Preview {
    HitTestingView()
}
