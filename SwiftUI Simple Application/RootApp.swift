//
//  RootApp.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/19/23.
//

import SwiftUI

final class RootApp: ObservableObject {
    
    // MARK: Set the first destination Here!
    var rootDestination = Destination.homeScreen
    
    @Published var path = NavigationPath()
    @Published var sheet: Destination?
    
    private func push(_ route: Destination) {
        path.append(route)
    }
    
    private func present(_ route: Destination) {
        sheet = route
    }
}

extension RootApp: AppRouter {
    
    func process(route: Destination, transition: Transition) {
        switch transition {
        case .push:
            push(route)
        case .present:
            present(route)
        }
    }
    
    func pop() {
        path.removeLast()
    }
    
    func pop(views: Int) {
        path.removeLast(views)
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
}

struct RootApp_View: View {
    
    @StateObject private var router = RootApp()
    
    var body: some View {
        
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

struct MyPreviewProvider_Previews: PreviewProvider {
    static var previews: some View {
        RootApp_View()
    }
}
