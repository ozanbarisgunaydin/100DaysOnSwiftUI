//
//  WriteDocumentaryDataView.swift
//  Bucket List
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import SwiftUI

struct WriteDocumentaryDataView: View {
    var body: some View {
        Button("Read & Write") {
            let data = Data("Test Message".utf8)
            let url = URL.documentsDirectory.appending(path: "message.txt")
            
            do {
                try data.write(to: url, options: [.atomic, .completeFileProtection])
                let input = try String(contentsOf: url)
                print("⭕️ \(input)")
            } catch {
                print("⭕️ \(error.localizedDescription)")
            }
        }
    }
}

#Preview {
    WriteDocumentaryDataView()
}
