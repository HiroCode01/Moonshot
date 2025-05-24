//
//  MissionView.swift
//  Moonshot
//
//  Created by HiRO on 24/05/25.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    var launchDate: String {
        mission.launchDate?.formatted(date: .long, time: .omitted) ?? "N/A"
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(.horizontal) {width, axis in width * 0.6}
                    .padding(.top)
                
                Text("Launch Date: \(launchDate)")
                    .font(.caption)
                    .padding(.top)
                    
                
                RectangleDivider()
                
                VStack(alignment: .leading) {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    RectangleDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                }
                .padding(.horizontal)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(crew, id: \.role) { crewMember in
                            NavigationLink {
                                AstronautView(astronaut: crewMember.astronaut)
                            } label: {
                                Image(crewMember.astronaut.id)
                                    .resizable()
                                    .frame(width: 104, height: 72)
                                    .clipShape(.capsule)
                                    .overlay(
                                        Capsule()
                                            .stroke(.white, lineWidth: 2)
                                    )
                                
                                VStack(alignment: .leading) {
                                    Text(crewMember.astronaut.name)
                                        .foregroundStyle(.white)
                                        .font(.headline)
                                    
                                    Text(crewMember.role)
                                        .foregroundStyle(.white.opacity(0.7))
                                }
                                .padding(.trailing)
                            }
                        }
                    }
                }
            }
            .padding(.bottom)
        }
        .navigationBarTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
}

#Preview {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    MissionView(mission: missions[1], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
