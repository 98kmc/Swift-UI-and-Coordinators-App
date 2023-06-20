//
//  DetailScreenCoordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/19/23.
//

import SwiftUI

final class DetailScreenCoordinator<R: Router>: Coordinator {

    private var router: R
    
    init(router: R) {
        self.router = router
    }
    
    func view() -> some View {
        Text("Detail")
    }
}

struct DetailScreenCoordinatorView<R: Router>: View {
    
    private var router: R
    private var coordinator: DetailScreenCoordinator<R>
    
    init(router: R) {
        self.router = router
        self.coordinator = DetailScreenCoordinator(router: router)
    }
    
    var body: some View {
        coordinator.view()
    }
}
