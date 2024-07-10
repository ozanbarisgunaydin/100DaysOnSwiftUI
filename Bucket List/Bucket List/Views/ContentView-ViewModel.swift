//
//  ContentView-ViewModel.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 11.07.2024.
//

import CoreLocation
import Foundation
import LocalAuthentication
import MapKit

extension ContentView {
    @Observable
    class ViewModel {
        private(set) var locations: [Location]
        var selectedPlace: Location?
        var isUnlocked = true
        
        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")
        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([Location].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("⭕️ Unable to save data - \(error.localizedDescription)")
            }
        }
        
        /// Converts the CGPoint type position to coordinate on map.
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = Location(
                id: UUID(),
                name: "New Location",
                description: "",
                latitude: point.latitude,
                longitude: point.longitude
            )
            locations.append(newLocation)
            save()
        }
        
        func update(location: Location) {
            guard let selectedPlace,
                  let index = locations.firstIndex(of: selectedPlace) else { return }
            locations[index] = location
            save()
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?
            
            if context.canEvaluatePolicy(
                .deviceOwnerAuthenticationWithBiometrics,
                error: &error
            ) {
                let reason = "Please authenticate yourself to unlock your places."
                context.evaluatePolicy(
                    .deviceOwnerAuthenticationWithBiometrics,
                    localizedReason: reason
                ) { success, authError in
                    if success {
                        self.isUnlocked = true
                    } else {
                        /// Error on biometrics
                        
                    }
                }
            } else {
                /// No biometrics
                
            }
        }
    }
}
