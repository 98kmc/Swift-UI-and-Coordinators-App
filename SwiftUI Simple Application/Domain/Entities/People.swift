//
//  People.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import Foundation

struct People: Codable {
    let name: String
    let height: String
    let mass: String
    let birthYear: String
    let gender: Gender
    let homeworld: String
    let url: URL?
}

enum Gender: String, Codable {
    case female = "female"
    case male = "male"
    case unknown = "n/a"
}
