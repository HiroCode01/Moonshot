//
//  ListLayout.swift
//  Moonshot
//
//  Created by HiRO on 25/05/25.
//

import SwiftUI

struct ListLayoutView: View {
    var missions: [Mission]
    var astronauts: [String: Astronaut]
    
    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(missions) {mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronauts)
                    } label: {
                        HStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding(10)
                            
                            VStack() {
                                Text(mission.displayName)
                                    .font(.title2.bold())
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.7))
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
                            .background(.lightBackground)
                        }
                        .frame(maxWidth: .infinity)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
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
    ListLayoutView(missions: missions, astronauts: astronauts)
        .preferredColorScheme(.dark)
}
