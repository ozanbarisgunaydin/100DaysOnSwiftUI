//
//  ShareLinkView.swift
//  Instafilter
//
//  Created by Ozan Barış Günaydın on 5.07.2024.
//

import SwiftUI

struct ShareLinkView: View {
    var body: some View {
//      ShareLink(
//          item: URL(string: "https://www.hackingwithswift.com")!,
//          subject: Text("Learn Swift"),
//          message: Text("Checkout 100 days of SwiftUI!")
//      )
        
//        ShareLink(
//            item: URL(string: "https://www.hackingwithswift.com")!
//        ) {
//            Label("Spread the word about Swift", systemImage: "swift")
//        }
        
        let example = Image(.example)
        ShareLink(item: example, preview: SharePreview("Singapore Airport", image: example)) {
            Label("Click to Share", systemImage: "airplane")
        }
    }
}

#Preview {
    ShareLinkView()
}
