//
//  SearchView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/05/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var searchViewModelInput: SearchViewModel.Input
    @ObservedObject private var searchViewModelOutput: SearchViewModel.Output
    
    var cancelBag = CancelBag()
    
    init(viewModel: SearchViewModel) {
        let searchViewModelInput = SearchViewModel.Input()
        searchViewModelOutput = viewModel.transform(searchViewModelInput, cancelBag: cancelBag)
        self.searchViewModelInput = searchViewModelInput
    }
    
    var body: some View {
        MovieNavigationView {
            VStack(spacing: 0) {
                SearchHeaderView()
                    .padding([.leading, .trailing, .bottom], 8)
                CategoryHeaderView()
                    .frame(height: searchViewModelOutput.filterGenreArray.isEmpty ? 0 : CategoryHeaderView.Constant.cellHeight)
                    .padding(searchViewModelOutput.filterGenreArray.isEmpty ? 0 : 8)
                    .transition(.opacity)
                    .animation(.easeInOut(duration: 0.2), value: UUID())
            }
        } bodyContent: {
            if searchViewModelOutput.filterMovieArray.isEmpty {
                Text("No  movie")
                    .background(Color.gray)
            } else {
                SearchResultView()
                    .padding()
            }
        }
        .onAppear {
            searchViewModelInput.loadTrigger.send()
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.gray.opacity(0.1))
        .environmentObject(searchViewModelInput)
        .environmentObject(searchViewModelOutput)
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        return SearchView(viewModel: viewModel)
    }
}
