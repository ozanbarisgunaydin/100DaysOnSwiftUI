//
//  ContentView.swift
//  BetterRest
//
//  Created by Ozan Barış Günaydın on 25.06.2024.
//

import CoreML
import SwiftUI

struct ContentView: View {
    @State private var wakeUp = defaultWakeTime
    @State private var sleepAmount = 8.0
    @State private var coffeeAmount = 1
    
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    @State private var showAlert = false
    
    @State private var neededSleepTime = ""
    
    /// `static` added for the remove self is not available alert on the `@State private var wakeUp = defaultWakeTime` line
    /// "Cannot use instance member 'defaultWakeTime' within property initializer; property initializers run before 'self' is available"
    static var defaultWakeTime: Date {
        var components = DateComponents()
        components.hour = 7
        components.minute = 0
        return Calendar.current.date(from: components) ?? .now
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        Text("When do you want to wake up?")
                            .font(.headline)
                        
                        DatePicker(
                            "Please enter a time",
                            selection: $wakeUp,
                            displayedComponents: .hourAndMinute
                        )
                        .labelsHidden()
                    }
                    .onChange(of: wakeUp) {
                        calculateBedtime()
                    }
                    
                    Section {
                        
                        Text("Desired amount of sleep")
                            .font(.headline)
                        
                        Stepper(
                            "\(sleepAmount.formatted()) hours",
                            value: $sleepAmount,
                            in: 4...12,
                            step: 0.25
                        )
                    }
                    .onChange(of: sleepAmount) {
                        calculateBedtime()
                    }
                    
                    Section {
                        
                        Text("Daily coffee amount")
                            .font(.headline)
                        
                        Stepper(
                            /// MarkDown formatted language solution for this `1 cup` and `1+ cups` issue:
                            /// "^[\(coffeeAmount) cup](inflect: true)"
                            coffeeAmount == 1 ? "1 cup": "\(coffeeAmount) cups",
                            value: $coffeeAmount,
                            in: 1...20
                        )
                        
                    }
                    .onChange(of: coffeeAmount) {
                        calculateBedtime()
                    }
                }
                
                Spacer()
                
                HStack {
                    Text("Needed sleep time is")
                        .font(.title2)
                        .fontWeight(.bold)
                    Spacer()
                    Text("\(neededSleepTime)")
                        .font(.largeTitle)
                        .foregroundColor(Color(red: 0.2, green: 0.8, blue: 0.6))
                        .fontWeight(.heavy)
                }
                .padding()
            }
            .navigationTitle("BetterRest")
            /// Commenting out the showAlert as it's not needed for automatic updates
//            .toolbar {
//                Button("Calculate", action: calculateBedtime)
//            }
            .alert(alertTitle, isPresented: $showAlert) {
                Button("OK") { }
            } message: {
                Text(alertMessage)
            }
        }
        .onAppear {
            calculateBedtime()
        }
    }
    
    func calculateBedtime() {
        do {
            let config = MLModelConfiguration()
            let model = try SleepCalculator(configuration: config)
            
            let components = Calendar.current.dateComponents([.hour, .minute], from: wakeUp)
            let hour = (components.hour ?? 0) * 60 * 60
            let minute = (components.minute ?? 0) * 60
            
            let prediction = try model.prediction(
                wake: Double(hour + minute),
                estimatedSleep: sleepAmount,
                coffee: Double(coffeeAmount)
            )
            
            let sleepTime = wakeUp - prediction.actualSleep
            
            
            alertTitle = "Your ideal bedtime is.."
            let calculatedSleepTime = sleepTime.formatted(
                date: .omitted,
                time: .shortened
            )
            alertMessage = calculatedSleepTime
            neededSleepTime = calculatedSleepTime
        } catch {
            alertTitle = "Error"
            alertMessage = "Sorry, there was a problem calculating your bed time"
        }
        
        /// Commenting out the showAlert as it's not needed for automatic updates
        // showAlert = true
    }
}

#Preview {
    ContentView()
}
