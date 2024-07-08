//
//  MapMarkers.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 8.07.2024.
//

import MapKit
import SwiftUI

struct MapMarkers: View {
    let startPosition = MapCameraPosition.region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 56, longitude: -3),
            span: MKCoordinateSpan(latitudeDelta: 10, longitudeDelta: 10)
        )
    )
    
    @State private var locations: [Location] = []
    
    var body: some View {
        MapReader { proxy in
            Map(initialPosition: startPosition) {
                ForEach(locations) { location in
                    Marker(
                        location.name,
                        coordinate: CLLocationCoordinate2D(
                            latitude: location.latitude,
                            longitude: location.longitude
                        )
                    )
                }
            }
            .onTapGesture { position in
                if let coordinate = proxy.convert(position, from: .local) {
                    /// Converts the CGPoint type position to coordinate on map.
                    let newLocation = Location(
                        id: UUID(),
                        name: "New Location",
                        description: "",
                        latitude: coordinate.latitude,
                        longitude: coordinate.longitude
                    )
                    locations.append(newLocation)
                }
            }
        }
    }
}

#Preview {
    MapMarkers()
}
