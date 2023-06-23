//
//  PeopleDetailScreen.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/22/23.
//

import SwiftUI

struct PeopleDetailScreen: View {
    
    @StateObject var viewModel: PeopleDetailViewModel
    
    var body: some View {
        
        VStack(alignment: .center) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(10)
            
            Text("\(viewModel.character.name)")
                .font(.title)
                .foregroundColor(.black)
        }
    }
}
