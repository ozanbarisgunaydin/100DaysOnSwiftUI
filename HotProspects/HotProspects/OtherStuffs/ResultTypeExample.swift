//
//  ResultTypeExample.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 20.07.2024.
//

import SwiftUI

struct ResultTypeExample: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "Found \(readings.count) readings"
        }
        
        let result = await fetchTask.result
        
        switch result {
        case .success(let string):
            output = string
        case .failure(let error):
            output = error.localizedDescription
        }
        
        /// Alternative
        /*
        do {
            output = try result.get()
        } catch {
            output = failure.localizedDescription
        }
         */
    }
}

#Preview {
    ResultTypeExample()
}
