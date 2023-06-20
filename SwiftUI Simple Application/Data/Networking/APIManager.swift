//
//  APIManager.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import Foundation

final class APIManager {
    
    static let shared = APIManager()
    let session = URLSession.shared
    
    init() { }
    
    func fetchPeople(page: String) async throws -> [PeopleDTO] {
        
        guard let url = URL(string: "\(Constants.BASE_URL)people/?page=\(page)") else { return [] }
        
        let (data, _) = try await session.data(from: url)
        let decoder = JSONDecoder()
        let peopleResponse = try decoder.decode(PeopleResponse.self, from: data)
        
        return peopleResponse.results
    }
}
