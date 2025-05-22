//
//  ContentView.swift
//  Moonshot
//
//  Created by HiRO on 20/05/25.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.decode("astronauts.json")
    
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
