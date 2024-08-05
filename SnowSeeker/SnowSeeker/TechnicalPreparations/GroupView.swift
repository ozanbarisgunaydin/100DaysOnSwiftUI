//
//  GroupView.swift
//  SnowSeeker
//
//  Created by Ozan Barış Günaydın on 5.08.2024.
//

import SwiftUI

struct UserView: View {
    var body: some View {
        Group {
            Text("Name: Paul")
            Text("Country: England")
            Text("Pets: Luna & Arya")
        }
        .font(.title)
    }
}

struct GroupView: View {
    @State private var layoutVertically = false
    var body: some View {
        Button {
            layoutVertically.toggle()
        }    label: {
            if layoutVertically {
                VStack {
                    UserView()
                }
            } else {
                HStack {
                    UserView()
                }
            }
        }
    }
}

struct GroupViewNative: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
    var body: some View {
        if horizontalSizeClass == .compact {
            VStack(content: UserView.init)
        } else {
            HStack(content: UserView.init)
        }
    }
}

struct ThatFitsView: View {
    var body: some View {
        ViewThatFits { /// Shows the view which can fit on device size
            Rectangle()
                .frame(width: 500, height: 200)
            
            Circle()
                .frame(width: 200, height: 200)
        }
    }
}

#Preview {
    ThatFitsView()
}
