//
//  ContentView.swift
//  BetterRest
//
//  Created by Ozan Barış Günaydın on 25.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    @State private var sleepAmount = 8.0
    @State private var coffeeAmound = 1
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("When do you want to wake up?")
                    .font(.headline)
                
                DatePicker(
                    "Please enter a time",
                    selection: $wakeUp,
                    displayedComponents: .hourAndMinute
                )
                .labelsHidden()
                
                Text("Desired amount of sleep")
                    .font(.headline)
                
                Stepper(
                    "\(sleepAmount) hours",
                    value: $sleepAmount,
                    in: 4...12,
                    step: 0.25
                )
                
                Text("Daily coffee amount")
                    .font(.headline)
                
                Stepper(
                    "\(coffeeAmound) cup(s)",
                    value: $coffeeAmound,
                    in: 1...20
                )
            }
            .navigationTitle("BetterRest")
            .toolbar {
                Button("Calculate", action: calculateBedtime)
            }
        }
    }
    
    func calculateBedtime() {
        
    }
}

#Preview {
    ContentView()
}
