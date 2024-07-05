//
//  MapKitView.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct MapKitView: View {
    let locations = [
        Location(name: "Bunkingham Palace", coordinate: .init(latitude: 51.501, longitude: -0.141)),
        Location(name: "Tower of London", coordinate: .init(latitude: 51.508, longitude: -0.076))
    ]
    
    var body: some View {
        VStack {
            MapReader { proxy in
                Map()
                    .onTapGesture { position in
                        if let coordinates = proxy.convert(position, from: .local) {
                            print("⭕️ \(coordinates)")
                        }
                    }
            }
            Spacer(minLength: 16)
            Text("------- ------- ------- -------")
            Spacer(minLength: 16)
            
            Map {
                ForEach(locations) { location in
                    Annotation(location.name, coordinate: location.coordinate) {
                        Text(location.name)
                            .font(.headline)
                            .padding()
                            .background(.blue.gradient)
                            .foregroundStyle(.white)
                            .clipShape(.capsule)
                    }
                    .annotationTitles(.hidden)
                }
            }
        }
    }
}

#Preview {
    MapKitView()
}
