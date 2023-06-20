//
//  HomeScreenCoordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

final class HomeScreenCoordinator<R: AppRouter>: ObservableObject, Coordinator, HomeScreenViewModelDelegate {
    
    private var router: R
    
    @ViewBuilder
    func view() -> HomeScreenView {
        let useCases = PeopleUseCases()
        let viewModel = HomeScreenViewModel(coordinator: self, useCases: useCases)
        HomeScreenView(viewModel: viewModel)
    }
    
    init(router: R) {
        self.router = router
    }
    
    func navigateToDetail(character: People) {
        router.process(route: .detailScreen(character: character), transition: .push)
    }
}


struct HomeScreenCoordinatorView<R: AppRouter>: View {
    
    private var router: R
    private var coordinator: HomeScreenCoordinator<R>
    
    init(router: R) {
        self.router = router
        coordinator = HomeScreenCoordinator(router: router)
    }
    
    var body: some View {
        coordinator.view()
    }
}
