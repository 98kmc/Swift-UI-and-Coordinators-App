//
//  PeopleDetailViewModel.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/22/23.
//

import Foundation

final class PeopleDetailViewModel: ObservableObject {
    
    @Published var character: People
    
    init(character: People) {
        self.character = character
    }
}
