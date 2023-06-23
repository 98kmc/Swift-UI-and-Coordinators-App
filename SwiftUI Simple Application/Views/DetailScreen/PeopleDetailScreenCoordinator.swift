//
//  PeopleDetailScreenCoordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/19/23.
//

import SwiftUI

final class PeopleDetailScreenCoordinator<R: Router>: Coordinator {
    
    private var router: R
    private var character: People
    
    init(router: R, character: People) {
        self.router = router
        self.character = character
    }
    
    func view() -> some View {
        let viewModel = PeopleDetailViewModel(character: self.character)
        return PeopleDetailScreen(viewModel: viewModel)
    }
}

struct PeopleDetailScreenCoordinatorView<R: Router>: View {
    
    private var router: R
    private var coordinator: PeopleDetailScreenCoordinator<R>
    private var character: People
    
    init(router: R, character: People) {
        self.router = router
        self.character = character
        self.coordinator = PeopleDetailScreenCoordinator(router: router, character: character)
    }
    
    var body: some View {
        coordinator.view()
    }
}
