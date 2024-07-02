//
//  HapticEffects.swift
//  CupcakeCorner
//
//  Created by Ozan Barış Günaydın on 2.07.2024.
//

import CoreHaptics
import SwiftUI

struct HapticEffects: View {
    @State private var counter = 0
    @State private var engine: CHHapticEngine?
    
    var body: some View {
        VStack {
            Spacer()

            /// Easy way
            Button("Tap Count \(counter)") {
                counter += 1
            }
            .sensoryFeedback(.increase, trigger: counter)
            .sensoryFeedback(.impact(flexibility: .solid, intensity: 1), trigger: counter)
            
            Spacer()
            
            /// Customizable Haptics (Hard way)
            Button("Play Haptic", action: complexSuccess)
                .onAppear(perform: prepareHaptics)
            
            Spacer()
        }
    }
    
    func prepareHaptics() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }
        
        do {
            engine = try CHHapticEngine()
            try engine?.start()
        } catch {
            print("⭕️ There was error on haptic engine: \(error.localizedDescription)")
        }
    }
    
    func complexSuccess() {
        guard CHHapticEngine.capabilitiesForHardware().supportsHaptics else { return }

        var events = [CHHapticEvent]()
        
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: i)
            events.append(event)
        }
        
        for i in stride(from: 0, through: 1, by: 0.1) {
            let intensity = CHHapticEventParameter(parameterID: .hapticIntensity, value: Float(1 - i))
            let sharpness = CHHapticEventParameter(parameterID: .hapticSharpness, value: Float(1 - i))
            let event = CHHapticEvent(eventType: .hapticTransient, parameters: [intensity, sharpness], relativeTime: 1 + i)
            events.append(event)
        }
        
        do {
            let pattern = try CHHapticPattern(events: events, parameters: [])
            let player = try engine?.makePlayer(with: pattern)
            try player?.start(atTime: 0)
        } catch {
            print("⭕️ There was error on haptic event: \(error.localizedDescription)")
        }
    }
}

#Preview {
    HapticEffects()
}
