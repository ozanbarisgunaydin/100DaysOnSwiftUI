//
//  CheckoutView.swift
//  CupcakeCorner
//
//  Created by Ozan Barış Günaydın on 2.07.2024.
//

import SwiftUI

struct CheckoutView: View {
    var order: Order
    
    @State private var confirmationMessage = ""
    @State private var showingConfirmationMessage = false

    var body: some View {
        ScrollView {
            VStack {
                AsyncImage(url: URL(string: "https://hws.dev/img/cupcakes@3x.jpg"), scale: 3) { image in
                    image
                        .resizable()
                        .scaledToFit()
                } placeholder: {
                    ProgressView()
                }
                .frame(height: 233)
                
                Text("Your total cost is \(order.cost, format: .currency(code: "USD"))")
                    .font(.title)
                
                Button("Place Order") {
                    Task { /// syncronous error passed with the Task block
                        await placeOrder()
                    }
                }
                .padding()
            }
        }
        .navigationTitle("Checkout")
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize) /// Only scrolls the content size greater then the device size
        .alert("Thank you!", isPresented: $showingConfirmationMessage) {
            Button("Ok") { }
        } message: {
            Text(confirmationMessage)
        }
    }
    
    func placeOrder() async {
        guard let encoded = try? JSONEncoder().encode(order) else {
            print("⭕️ Fail to encode order!")
            return
        }
        
        guard let url = URL(string: "https://reqres.in/api/cupcakes") else {
            print("⭕️ Fail to create URL!")
            return
        }
        
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        
        do {
            let (data, _) = try await URLSession.shared.upload(for: request, from: encoded)
            let decodedOrder = try JSONDecoder().decode(Order.self, from: data)
            confirmationMessage = "Your order for \(decodedOrder.quantity)x\(Order.types[decodedOrder.type].lowercased()) cupcakes is on its way!"
            showingConfirmationMessage = true
        } catch {
            print("⭕️ Check out failed: \(error.localizedDescription)")
            
        }
    }
}

#Preview {
    CheckoutView(order: Order())
}
