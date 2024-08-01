//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Ozan Barış Günaydın on 1.08.2024.
//

import SwiftUI

extension VerticalAlignment {
    struct MidAccountAndName: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[.top]
        }
    }
    
    static let midAccountAndName = VerticalAlignment(MidAccountAndName.self)
}

struct ContentView: View {
    var body: some View {
        HStack(alignment: .midAccountAndName) {
            VStack {
                Text("@twostraws")
                    .alignmentGuide(.midAccountAndName) { dimension  in
                        dimension[VerticalAlignment.center]
                    }
                
                Image(.paulHudson)
                    .resizable()
                    .frame(width: 64, height: 64)
            }
            
            VStack {
                Text("Full name:")
                Text("PAUL HUDSON")
                    .alignmentGuide(.midAccountAndName) { dimension  in
                        dimension[VerticalAlignment.center]
                    }
                    .font(.largeTitle)

            }
        }
    }
}

#Preview {
    ContentView()
}
