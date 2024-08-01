//
//  AlertWithOptinals.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 2.08.2024.
//

import SwiftUI

struct User: Identifiable {
    var id = "Taylor Swift"
}

struct AlertWithOptinals: View {
    @State private var selectedUser: User? = nil
    @State private var isShowingUser = false
    
    var body: some View {
        Button("Tap Me") {
            selectedUser = User()
            isShowingUser = true
        }
        .sheet(item: $selectedUser) { user in
            Text(user.id)
                .presentationDetents([.medium, .large]) /// Medium is pan modal style bottom sheet
        }
//        .alert("Welcome", isPresented: $isShowingUser, presenting: selectedUser) { user in
//            Button(user.id) { }
//        }
    }
}

#Preview {
    AlertWithOptinals()
}
