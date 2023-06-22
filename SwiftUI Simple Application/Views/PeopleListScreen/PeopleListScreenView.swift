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

struct PeopleList: View {
    
    @StateObject var viewModel: PeopleListViewModel
   
    var body: some View {

        List {
            ForEach(viewModel.peopleList , id: \.name) { character in
                HStack(alignment: .center) {
                    
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40)
                        .padding(10)
                    
                    Text("\(character.name)")
                        .font(.title)
                        .foregroundColor(.black)
                        .onAppear {
                            viewModel.fetchMorePeopleIfNeeeded(character)
                        }
                }
                .onTapGesture {
                    viewModel.navigateToDetail(character: character)
                }
            }
        }
    }
}

struct PeopleListScreenView: View {
    
    @StateObject var viewModel: PeopleListViewModel
    
    var body: some View {
        if viewModel.peopleList.isEmpty {
            LoadingSpinner()
        }
        
        PeopleList(viewModel: viewModel)
        .onAppear {
            viewModel.fetchMorePeopleIfNeeeded(nil)
        }
    }
}

struct PeopleListScreenView_Previews: PreviewProvider {
    
    static let viewModel = PeopleListViewModel(
        coordinator: PeopleListScreenCoordinator(router: RootApp()) as! PeopleListViewModelDelegate,
        useCases: PeopleUseCases())
    
    static var previews: some View {
        PeopleListScreenView(viewModel: viewModel)
    }
}
