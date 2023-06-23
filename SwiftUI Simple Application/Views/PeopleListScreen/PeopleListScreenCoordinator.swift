//
//  HomeScreenCoordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

final class PeopleListScreenCoordinator<R: AppRouter>: ObservableObject, Coordinator, PeopleListViewModelDelegate {
    
    private var router: R
    
    @ViewBuilder
    func view() -> PeopleListScreenView {
        let useCases = PeopleUseCases()
        let viewModel = PeopleListViewModel(coordinator: self, useCases: useCases)
        PeopleListScreenView(viewModel: viewModel)
    }
    
    init(router: R) {
        self.router = router
    }
    
    func navigateToDetail(character: People) {
        router.process(route: .detailScreen(character: character), transition: .push)
    }
}


struct PeopleListScreenCoordinatorView<R: AppRouter>: View {
    
    private var router: R
    private var coordinator: PeopleListScreenCoordinator<R>
    
    init(router: R) {
        self.router = router
        coordinator = PeopleListScreenCoordinator(router: router)
    }
    
    var body: some View {
        coordinator.view()
    }
}
