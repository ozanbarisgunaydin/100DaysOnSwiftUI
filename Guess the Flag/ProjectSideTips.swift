//
//  ProjectSideTips.swift
//  Guess the Flag
//
//  Created by Ozan Barış Günaydın on 24.06.2024.
//

import Foundation

// MARK: - Glass Effect
//ZStack {
//    VStack(spacing: 0) {
//        Color.red
//        Color.blue
//    }
//
//    Text("Your content")
//        .foregroundStyle(.secondary)
//        .padding(50)
//        .background(.ultraThinMaterial)
//}
//.ignoresSafeArea()

// MARK: - Simple gradient
//LinearGradient(
//    colors: [
//        .red,
//        .blue
//    ],
//    startPoint: .top,
//    endPoint: .bottom
//)

// MARK: - Linear Stop Grandient
//LinearGradient(
//    stops: [
//        .init(color: .white, location: 0.45),
//        .init(color: .black, location: 0.55)
//    ],
//    startPoint: .top,
//    endPoint: .bottom
//)

// MARK: - Radial Gradient
//RadialGradient(
//    colors: [.blue, .red],
//    center: .center,
//    startRadius: 0,
//    endRadius: 150
//)

// MARK: - Angular Gradient
//AngularGradient(colors: [.red, .yellow, .green, .blue, .red], center: .center)

// MARK: - Color `.gradient` effect
//Text("Hello, world!")
//    .frame(maxWidth: .infinity, maxHeight: .infinity)
//    .foregroundColor(.white)
//    .background(.indigo.gradient)

// MARK: - Button Styles
//VStack {
//    Button("Button 1") { }
//        .buttonStyle(.bordered)
//
//    Button("Button 2", role: .destructive) { }
//        .buttonStyle(.bordered)
//
//    Button("Button 3") { }
//        .buttonStyle(.borderedProminent)
//        .tint(.indigo)
//
//    Button("Button 4", role: .destructive) { }
//        .buttonStyle(.borderedProminent)
//}

// MARK: - Custom Button
//Button {
//    print("⭕️ Button was tapped")
//} label: {
//    Text("Tap me!")
//        .padding()
//        .foregroundColor(.white)
//        .background(.red)
//    }

//Button {
//    print("⭕️ Button was tapped")
//} label: {
//    Label("Edit", systemImage: "pencil")
//        .padding()
//        .foregroundStyle(.white)
//        .background(.red.gradient)
//        .cornerRadius(4)
//}


// MARK: - Simple Alert
//struct ContentView: View {
//    @State private var showingAlert = false
//
//    var body: some View {
//        Button("Show Alert!") {
//            showingAlert = true
//        }
//        .alert("Important message", isPresented: $showingAlert) {
//            Button("Delete", role: .destructive) { }
//            Button("Cancel", role: .cancel) { }
//        } message: {
//            Text("Please read this.")
//        }
//    }
//}
