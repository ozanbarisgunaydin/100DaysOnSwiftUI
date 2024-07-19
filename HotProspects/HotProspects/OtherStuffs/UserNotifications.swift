//
//  UserNotifications.swift
//  HotProspects
//
//  Created by Ozan Barış Günaydın on 20.07.2024.
//

import SwiftUI
import UserNotifications

struct UserNotifications: View {
    var body: some View {
        VStack {
            Button("Request Permission") {
                UNUserNotificationCenter.current().requestAuthorization(
                    options: [.alert, .badge, .sound]
                ) { success, error in
                    if success {
                        print("⭕️ all set")
                    } else if let error {
                        print("⭕️ \(error.localizedDescription)")
                    }
                }
            }
            
            Button("Schedule Notification") {
                let content = UNMutableNotificationContent()
                content.title = "Feed the cat"
                content.subtitle = "It looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(
                    timeInterval: 5,
                    repeats: false
                )
                
                let request = UNNotificationRequest(
                    identifier: UUID().uuidString,
                    content: content,
                    trigger: trigger
                )
                
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
}

#Preview {
    UserNotifications()
}
