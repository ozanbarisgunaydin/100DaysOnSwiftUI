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
    let type: ExpenseType
    let amount: Double
}

enum ExpenseType: String, Codable {
    case personal = "Personal"
    case business = "Business"
}

@Observable /// Makes updates views
class Expenses: Identifiable, Codable {
    var id = UUID()
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

struct PriceModifier: ViewModifier {
    let amount: Double
    
    func body(content: Content) -> some View {
        let color: Color = if amount < 10 {
            .init(white: 0.3)
        } else if amount < 100 {
            .yellow
        } else {
            .red
        }
        
        content
            .foregroundColor(color)
            .font(Font.system(.body, weight: .semibold))
    }
}

struct ExpenseList: View {
    let items: [ExpanseItem]
    let selectedItemCallback: ((ExpanseItem) -> Void)

    var body: some View {
        ForEach(items) { item in
            HStack {
                VStack(alignment: .leading) {
                    Text(item.name)
                        .font(.headline)
                    
                    Text(item.type.rawValue)
                }
                
                Spacer()
                
                let amount = item.amount
                Text(
                    amount,
                    format: .currency(code: Locale.current.currency?.identifier ?? "USD")
                )
                .modifier(
                    PriceModifier(amount: amount)
                )
            }
        }
        .onDelete(perform: { indexSet in
            selectedItemCallback(items[indexSet.last ?? 0])
        })
    }
}

struct ContentView: View {
    @State private var expenses = Expenses()
    
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                let personalItems = expenses.items.filter({ $0.type == .personal})
                if !personalItems.isEmpty {
                    Section("Personal") {
                        ExpenseList(
                            items: personalItems
                        ) { selectedItem in
                            removeItem(of: selectedItem)
                        }
                    }
                }
                
                let businessItems = expenses.items.filter({ $0.type == .business})
                if !businessItems.isEmpty {
                    Section("Business") {
                        ExpenseList(
                            items: businessItems
                        ) { selectedItem in
                            removeItem(of: selectedItem)
                        }
                    }
                }
            }
            .navigationTitle("iExpense")
            .toolbar {
                Button("Add Expense", systemImage: "plus.circle") {
                    showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItem(of item: ExpanseItem) {
        expenses.items.removeAll(where: {$0.id == item.id })
    }
}

#Preview {
    ContentView()
}
