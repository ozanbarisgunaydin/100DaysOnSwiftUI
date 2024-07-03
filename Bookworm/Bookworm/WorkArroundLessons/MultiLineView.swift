//
//  MultiLineView.swift
//  Bookworm
//
//  Created by Ozan Barış Günaydın on 3.07.2024.
//

import SwiftUI

struct MultiLineView: View {
    @AppStorage("notes") private var notes = ""
    
    var body: some View {
        NavigationStack {
            /// `axis: .vertical` automatically expandents it's height when the text is not fit the size.
            /// It means the field update itself as multiline.
            TextField("Enter your note", text: $notes, axis: .vertical)
//            TextEditor(text: $notes)
                .textFieldStyle(.roundedBorder)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    MultiLineView()
}
