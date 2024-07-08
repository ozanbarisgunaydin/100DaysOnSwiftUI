//
//  BiometricAuth.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 8.07.2024.
//

import LocalAuthentication
import SwiftUI

struct BiometricAuth: View {
    @State private var isUnlocked = false
    
    var body: some View {
        VStack {
            if isUnlocked {
                Text("Unlocked")
            } else {
                Text("Locked")
            }
        }
        .onAppear(perform: authenticate)
    }
    
    func authenticate() {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            let reason = "We need to unlock your data."
            context.evaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                localizedReason: reason) { success, authenticateError in
                    if success {
                        /// Authenticated successfully
                        isUnlocked = true
                    } else {
                        /// There was a problem
                        
                    }
                }
        } else {
            /// No biometrics
        }
    }
}

#Preview {
    BiometricAuth()
}
