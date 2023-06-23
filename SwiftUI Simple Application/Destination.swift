//
//  Destination.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/19/23.
//

import SwiftUI

enum Destination: Hashable, Identifiable {
    
    case homeScreen
    case detailScreen(character: People)
    
    var id: String {
        String(describing: self)
    }
    
    @ViewBuilder
    func coordinatorFor<R: AppRouter>(router: R) -> some View {
        
        switch self {
        case .homeScreen:
            PeopleListScreenCoordinatorView(router: router)
            
        case .detailScreen(let character):
            PeopleDetailScreenCoordinatorView(router: router, character: character)
        }
    }
    
    static func == (lhs: Destination, rhs: Destination) -> Bool {
        lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}
