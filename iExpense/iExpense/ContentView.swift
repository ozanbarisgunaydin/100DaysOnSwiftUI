//
//  ContentView.swift
//  iExpense
//
//  Created by Ozan Barış Günaydın on 27.06.2024.
//

import SwiftUI

struct ExpanseItem: Identifiable, Codable { /// `Identifiable` guarantee the uniq identity and we can delete the `id: \.id` line on the `ForEach`
    var id = UUID() /// This is required from Identifiable protocol
    let name: String
    let type: String
    let amount: Double
}

@Observable /// Makes updates views
class Expenses: Codable {
    var items: [ExpanseItem] = [] {
        didSet {
            guard let encoded = try? JSONEncoder().encode(items) else { return }
            UserDefaults.standard.setValue(encoded, forKey: "Items")
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items"),
           let decodedItems = try? JSONDecoder().decode([ExpanseItem].self, from: savedItems) {
            items = decodedItems
        } else {
            items = []
        }
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenses.items) { item in
                    Text(item.name)
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}
