//
//  HomeScreenView.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenCoordinator().start()
    }
}

struct HomeScreenView<VM: HomeScreenViewModel>: View {
    
    @StateObject var viewModel: VM
    
    var body: some View {
        VStack {
            
        }
    }
}
