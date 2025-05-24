//
//  ContentView.swift
//  Moonshot
//
//  Created by HiRO on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [GridItem(.adaptive(minimum: 150))]
    
    @State private var showingGridView = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGridView {
                    GridLayoutView(missions: missions, astronauts: astronauts)
                } else {
                    ListLayoutView(missions: missions, astronauts: astronauts)
                }
            }
            .navigationTitle("MoonShot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Menu {
                        Button() {
                            withAnimation {
                                showingGridView = true
                            }
                        } label: {
                            HStack {
                                Text("Grid View")
                                if showingGridView {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                        Button() {
                            withAnimation {
                                showingGridView = false
                            }
                        } label: {
                            HStack {
                                Text("List View")
                                if !showingGridView {
                                    Image(systemName: "checkmark")
                                }
                            }
                        }
                    } label: {
                        Image(systemName: "ellipsis.circle")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
