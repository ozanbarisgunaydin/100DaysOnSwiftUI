//
//  ContentView.swift
//  Moonshot
//
//  Created by Ozan Barış Günaydın on 28.06.2024.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String:Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    @State private var isGridView = true
    
    var body: some View {
        NavigationStack {
            ScrollView {
                Group {
                    if isGridView {
                        LazyVGrid(columns: columns) {
                            ForEach(missions) { mission in
                                missionView(for: mission)
                            }
                        }
                    } else {
                        VStack {
                            ForEach(missions) { mission in
                                missionView(for: mission)
                            }
                        }
                    }
                }
                .padding([.horizontal, .bottom])
                .transition(.opacity)
                .animation(.easeInOut, value: isGridView)
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        withAnimation {
                            isGridView.toggle()
                        }
                    }) {
                        Image(systemName: isGridView ? "rectangle.grid.1x2" : "square.grid.2x2")
                            .foregroundColor(.white)
                    }
                }
            }
        }
    }
    
    @ViewBuilder
    func missionView(for mission: Mission) -> some View {
        NavigationLink {
            MissionView(mission: mission, astronauts: astronauts)
        } label: {
            if isGridView {
                GridMissionView(mission: mission)
            } else {
                ListMissionView(mission: mission)
            }
        }
    }
}

#Preview {
    ContentView()
}
