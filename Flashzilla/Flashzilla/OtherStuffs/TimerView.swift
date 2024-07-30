//
//  TimerView.swift
//  Flashzilla
//
//  Created by Ozan Barış Günaydın on 30.07.2024.
//

import SwiftUI

struct TimerView: View {
    let timer = Timer.publish(
        every: 1,
        tolerance: 0.5,
        on: .main,
        in: .common
    ).autoconnect()
    
    @State private var counter = 0
    
    var body: some View {
        Text("Hello")
            .onReceive(timer) { time in
                if counter == 5 {
                    timer.upstream.connect().cancel()

                } else {
                    print("⭕️ \(time)")
                }
                counter += 1
            }
    }
    
    func cancelTimer() {
        timer.upstream.connect().cancel()
    }
}

#Preview {
    TimerView()
}
