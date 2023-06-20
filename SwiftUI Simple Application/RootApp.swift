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
