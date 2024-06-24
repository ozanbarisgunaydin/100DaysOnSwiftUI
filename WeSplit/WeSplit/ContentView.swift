//
//  ContentView.swift
//  keepscore
//
//  Created by Ozan Barış Günaydın on 13.06.2024.
//

import SwiftUI

struct ContentView: View {
    @State private var checkAmount = 0.0
    @State private var peopleCount = 2
    @State private var tipPercantage = 20
    
    @FocusState private var amounIsFocused: Bool
    
    let tipPercantages = [10, 15, 20, 25, 0]
    
    var totalPerPerson: Double {
        let peopleCount = Double(peopleCount + 2)
        let tipSelection = Double(tipPercantage)
        
        let tipValue = checkAmount / 100 * tipSelection
        let grandTotal = checkAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return amountPerPerson
    }
    
    var totalTipAmount: Double {
        let tipSelection = Double(tipPercantage)
        let tipValue = checkAmount / 100 * tipSelection
        
        return tipValue
    }
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField(
                        "Amount",
                        value: $checkAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "TRY")
                    )
                    .keyboardType(.decimalPad)
                    .focused($amounIsFocused)
                    
                    Picker("Number of people", selection: $peopleCount) {
                        ForEach(2..<100) {
                            Text("\($0) people")
                        }
                    }
                    .pickerStyle(.navigationLink)
                }
                
                Section("How much do you want to tip?") {
                    Picker("Tip Percentage", selection: $tipPercantage) {
                        ForEach(tipPercantages, id: \.self) {
                            Text($0, format: .percent)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                Section("Amount per person") {
                    Text(
                        totalPerPerson,
                        format: .currency(code: Locale.current.currency?.identifier ?? "TRY")
                    )
                }
                
                Section("Total tip value") {
                    Text(
                        totalTipAmount,
                        format: .currency(code: Locale.current.currency?.identifier ?? "TRY")
                    )
                    .foregroundColor(tipPercantage == 0 ? .red : .black)
                }
            }
            .navigationTitle("WeSplit")
            .toolbar {
                if amounIsFocused {
                    Button("Done") {
                        amounIsFocused = false
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
