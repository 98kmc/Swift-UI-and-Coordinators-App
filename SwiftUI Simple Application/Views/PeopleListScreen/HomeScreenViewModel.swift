//
//  HomeScreenViewModel.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

enum HomeScreenViewModelState {
    case loading
    case ready
    case error
}

protocol HomeScreenViewModelDelegate {
    
    func navigateToDetail(character: People)
}

final class HomeScreenViewModel: ObservableObject {
    
    let coordinator: HomeScreenViewModelDelegate
    let peopleUseCases: PeopleUseCases
    
    @Published var people: [People] = []
    @Published var state: HomeScreenViewModelState!
    
    init(coordinator: HomeScreenViewModelDelegate, useCases: PeopleUseCases) {
        self.coordinator = coordinator
        peopleUseCases = useCases
    
        getPeople()
    }
    
    func getPeople() {
        state = .loading
        
        Task {
            
            do {
                let fetchedPeople = try await peopleUseCases.fetchPeople(page: "1")
                DispatchQueue.main.async {
                    self.people = fetchedPeople
                    self.state = .ready
                }
            } catch {
                state = .error
                print(error)
            }
        }
    }
    
    func navigateToDetail(character: People) {
        coordinator.navigateToDetail(character: character)
    }
}
