//
//  ContentView.swift
//  iExpense
//
//  Created by Ozan Barış Günaydın on 27.06.2024.
//

import SwiftUI

struct SecondView: View {
    @Environment(\.dismiss) private var dismiss
    let name: String
    
    var body: some View {
        VStack {
            Text("Hello, \(name)")
            Button("Dismiss") {
                dismiss()
            }
            
        }
        .padding()
    }
}

struct ContentView: View {
    @State private var showingSheet = false
    
    var body: some View {
        Button("Show Sheet") {
            showingSheet.toggle()
        }
        .sheet(isPresented: $showingSheet) {
            SecondView(name: "OBG")
        }
    }
}

#Preview {
    ContentView()
}
