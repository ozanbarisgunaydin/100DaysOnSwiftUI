//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 24.07.2024.
//

import SwiftData
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none, contancted, uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
    let filter: FilterType
    
    var title: String {
        switch filter {
        case .none:
            "Everyone"
        case .contancted:
            "Contacted People"
        case .uncontacted:
            "Uncontacted People"
        }
    }
    
    var body: some View {
        NavigationStack {
            Text("Peple: \(prospects.count)")
                .navigationTitle(title)
                .toolbar {
                    Button("Scan", systemImage: "qrcode.viewfinder") {
                        let prospet = Prospect(
                            name: "Paul Hudson",
                            emailAddress: "paul@hackingswift.com",
                            isContacted: false
                        )
                        modelContext.insert(prospet)
                    }
                }
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
