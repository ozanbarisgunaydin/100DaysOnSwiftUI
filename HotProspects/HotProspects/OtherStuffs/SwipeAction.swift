//
//  SwipeAction.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 20.07.2024.
//

import SwiftUI

struct SwipeAction: View {
    var body: some View {
        List {
            Text("Taylor Swift")
                .swipeActions {
                    Button("Delete", systemImage: "minus.circle", role: .destructive) {
                        print("Deleting")
                    }
                }
                .swipeActions(edge: .leading) {
                    Button("Pin", systemImage: "pin") {
                        print("Pinning")
                    }
                    .tint(.orange)
                }
        }
    }
}

#Preview {
    SwipeAction()
}
