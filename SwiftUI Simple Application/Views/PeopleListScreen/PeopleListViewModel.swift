//
//  HomeScreenViewModel.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

enum PeopleListViewModelState {
    case loading
    case ready
    case error
}

protocol PeopleListViewModelDelegate {
    
    func navigateToDetail(character: People)
}

final class PeopleListViewModel: ObservableObject {
    
    private let coordinator: PeopleListViewModelDelegate
    private let peopleUseCases: PeopleUseCases
    private var currentPage: Int = 1
    
    @Published var peopleList: [People] = []
    @Published var state: PeopleListViewModelState!
    @Published var  shouldShowFetchingMorePeopleSpinner = false
 
    init(coordinator: PeopleListViewModelDelegate, useCases: PeopleUseCases) {
        self.coordinator = coordinator
        peopleUseCases = useCases
    }
    
    private func getPeople(page: Int) {
        state = .loading
        
        Task {
            
            do {
                let fetchedPeople = try await peopleUseCases.fetchPeople(page: String(page))
                DispatchQueue.main.async {
                    self.peopleList = self.peopleList + fetchedPeople
                    self.state = .ready
                    self.shouldShowFetchingMorePeopleSpinner = false
                }
            } catch {
                DispatchQueue.main.async {
                    self.state = .error
                    print(error)
                }
            }
        }
    }
    
    func fetchMorePeopleIfNeeeded(_ item: People?) {
        
        guard let lastItem = item else {
            getPeople(page: currentPage)
            return
        }
        
        if lastItem.name == peopleList[peopleList.count - 5].name  {
            currentPage += 1
            getPeople(page: currentPage)
        }
    }
    
    func showFetchingMorePeopleSpinnerIfNeeded(_ item: People?) {
        guard let lastItemName = peopleList.last?.name,
              let lastItem = item,
              lastItem.name == lastItemName else { return }
        
        shouldShowFetchingMorePeopleSpinner = true
        
    }
    
    func navigateToDetail(character: People) {
        coordinator.navigateToDetail(character: character)
    }
}
