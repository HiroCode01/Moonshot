//
//  AstronautView.swift
//  Moonshot
//
//  Created by HiRO on 24/05/25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    var onDone: (() -> Void?)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
        }
        .toolbar {
            Button("Home") {
                onDone()
            }
        }
        .background(.darkBackground)
        .navigationBarTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return AstronautView(astronaut: astronauts["armstrong"]!, onDone: {nil})
        .preferredColorScheme(.dark)
}
