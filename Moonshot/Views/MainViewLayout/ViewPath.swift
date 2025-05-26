//
//  ViewPath.swift
//  Moonshot
//
//  Created by HiRO on 26/05/25.
//

import Foundation

enum NavigationRoute: Hashable {
    case listView
    case gridView
    case missionView(Mission)
    case astroanutView(Astronaut)
}
