//
//  GridLayoutView.swift
//  Moonshot
//
//  Created by HiRO on 25/05/25.
//

import SwiftUI

struct GridLayoutView: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]

    let columns = [GridItem(.adaptive(minimum: 150))]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) {mission in
                    NavigationLink(value: NavigationRoute.missionView(mission)){
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text("\(mission.displayName)")
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                        .accessibilityElement()
                        .accessibilityLabel(Text("Tap to view details for \(mission.displayName)"))
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    GridLayoutView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
