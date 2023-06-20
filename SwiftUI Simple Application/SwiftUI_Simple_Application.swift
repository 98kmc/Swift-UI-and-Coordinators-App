//
//  SwiftUI_Simple_Application.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

@main
struct SwiftUI_Simple_Application: App {
    
    @StateObject private var router = RootApp()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                
                router.rootDestination.coordinatorFor(router: router)
                    .navigationDestination(for: Destination.self) { transition in
                        transition.coordinatorFor(router: router)
                    }
                    .sheet(item: $router.sheet, content: { transition in
                        transition.coordinatorFor(router: router)
                    })
                    .navigationTitle("Starwars Characters")
                    .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}
