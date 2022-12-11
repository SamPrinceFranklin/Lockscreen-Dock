//
//  Lockscreen_DockApp.swift
//  Lockscreen Dock
//
//  Created by Sam Prince K on 11/12/22.
//

import SwiftUI

@main
struct Lockscreen_DockApp: App {
    @Environment(\.openURL) var openURL
    var body: some Scene {
        WindowGroup {
            ContentView()
                .onOpenURL{ url in
                   openURL(url)
                }
        }
    }
}
