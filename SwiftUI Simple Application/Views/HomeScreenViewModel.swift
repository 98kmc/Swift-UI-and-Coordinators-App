//
//  HomeScreenViewModel.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

final class HomeScreenViewModel: ObservableObject {
    
    let coordinator: HomeScreenCoordinator
    
    init(coordinator: HomeScreenCoordinator) {
        self.coordinator = coordinator
    }
}
