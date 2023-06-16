//
//  Coordinator.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

protocol Coordinator {
    
    associatedtype Screen: View
    
    func start() -> Screen
}
