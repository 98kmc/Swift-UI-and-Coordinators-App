//
//  HomeScreenView.swift
//  SwiftUI Simple Application
//
//  Created by Miguel on 6/16/23.
//

import SwiftUI

struct LoadingSpinner: View {

    var body: some View {
        VStack {
            ProgressView {
                Text("Loading...")
                    .font(.title2)
                    .foregroundColor(.yellow)
            }
            .progressViewStyle(CircularProgressViewStyle(tint: .yellow))
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

struct PeopleItemCell: View {
    
    var character: People
    
    var body: some View {
        HStack(alignment: .center) {
            
            Image(systemName: "person.circle.fill")
                .resizable()
                .frame(width: 40, height: 40)
                .padding(10)
            
            Text("\(character.name)")
                .font(.title)
                .foregroundColor(.black)
        }
    }
}

struct PeopleList: View {
    
    var peopleList: [People] = []
    var clickAction: ((People) -> Void)?
    
    var body: some View {
        List {
            ForEach(peopleList , id: \.name) { value in
                PeopleItemCell(character: value)
                    .onTapGesture {
                        clickAction?(value)
                    }
            }
        }
    }
}

struct HomeScreenView: View {
    
    @StateObject var viewModel: HomeScreenViewModel
    
    var body: some View {
            VStack(alignment: .center) {
                
                if viewModel.state == .loading {
                    LoadingSpinner()
                }
                
                PeopleList(peopleList: viewModel.people) { character in
                    viewModel.navigateToDetail(character: character)
                }
        }
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    
    static let viewModel = HomeScreenViewModel(
        coordinator: HomeScreenCoordinator(router: RootApp()),
        useCases: PeopleUseCases())
    
    static var previews: some View {
        HomeScreenView(viewModel: viewModel)
    }
}
