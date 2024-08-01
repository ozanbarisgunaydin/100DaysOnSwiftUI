//
//  SideBySideViews.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct SideBySideViews: View {
    var body: some View {
        NavigationSplitView(preferredCompactColumn: .constant(.detail)) {
            NavigationLink("Primary") {
                Text("New view")
            }
        } detail: {
            Text("Content")
                .toolbar(.hidden, for: .navigationBar)
        }
        .navigationSplitViewStyle(.balanced)
    }
}

#Preview {
    SideBySideViews()
}
