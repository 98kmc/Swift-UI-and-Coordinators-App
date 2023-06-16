//
//  HomeScreenCoordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

final class HomeScreenCoordinator: Coordinator {
    
    lazy var screen: HomeScreenView = {
        let viewModel = HomeScreenViewModel(coordinator: self)
        return HomeScreenView(viewModel: viewModel)
    }()
    
    
    func start() -> some View {
        screen
    }
}
