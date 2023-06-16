//
//  SwiftUI_Simple_ApplicationApp.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

@main
struct SwiftUI_Simple_ApplicationApp: App {
    
    let firstScreen = HomeScreenCoordinator()
    
    var body: some Scene {
        WindowGroup {
            firstScreen.start()
        }
    }
}
