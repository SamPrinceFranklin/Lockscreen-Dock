//
//  DockAttributes.swift
//  Lockscreen Dock
//
//  Created by Sam Prince K on 11/12/22.
//

import SwiftUI
import ActivityKit

struct DockAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
    
    var addedLinks: [Applink]
}
