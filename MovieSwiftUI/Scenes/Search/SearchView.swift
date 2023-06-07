//
//  SearchView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/05/2023.
//

import SwiftUI

struct SearchView: View {
    
    @ObservedObject private var input: SearchViewModel.Input
    @ObservedObject private var output: SearchViewModel.Output
    var cancelBag = CancelBag()
    
    init(viewModel: SearchViewModel) {
        let input = SearchViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        MovieNavigationView {
            VStack(spacing: 0) {
                SearchHeaderView()
                    .padding([.leading, .trailing], 8)
                CategoryHeaderView()
                    .padding(8)
            }
        } bodyContent: {
            Text("This is content")
        }
        .ignoresSafeArea(edges: .bottom)
        .background(Color.gray.opacity(0.1))
        .environmentObject(input)
        .environmentObject(output)
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
