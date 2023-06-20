//
//  PeopleDTO.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import Foundation

struct PeopleResponse: Codable {
    let results: [PeopleDTO]
}

struct PeopleDTO: Codable {
    let name: String?
    let height: String?
    let mass: String?
    let hair_color: String?
    let skin_color: String?
    let eye_color: String?
    let birth_year: String?
    let gender: String?
    let homeworld: String?
    let films: [String]?
    let species: [String]?
    let vehicles: [String]?
    let starships: [String]?
    let created: String?
    let edited: String?
    let url: String?
}

extension PeopleDTO {
    
    func toPeopleObject() -> People {
        return People(name: self.name ?? "character_name",
                      height: self.height ?? "-",
                      mass: self.mass ?? "-",
                      birthYear: self.birth_year ?? "-",
                      gender: Gender(rawValue: self.gender ?? "unknown") ?? .unknown,
                      homeworld: self.homeworld ?? "-",
                      url: URL(string: self.url ?? ""))
    }
}
