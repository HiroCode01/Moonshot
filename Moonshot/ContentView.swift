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
    
    var body: some View {
        VStack {
            Image(systemName: "moon.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(astronauts.count)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
