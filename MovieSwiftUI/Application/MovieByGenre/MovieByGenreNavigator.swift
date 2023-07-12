//
//  MovieByGenreNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 06/07/2023.
//

import SwiftUI

protocol MovieByGenreNavigatorType {
    func toMovieDetailScreen(movie: Movie)
    func backToPrevious()
    func toSearchScreen()
}

struct MovieByGenreNavigator: MovieByGenreNavigatorType {
    
    let navigationController: UINavigationController
    
    func toMovieDetailScreen(movie: Movie) {
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let useCase = MovieDetailUseCase()
        let viewModel = MovieDetailViewModel(navigator: navigator, useCase: useCase, movie: movie)
        let movieDetailView = MovieDetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: movieDetailView)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func backToPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let searchView = SearchView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: searchView)
        navigationController.pushViewController(viewController, animated: true)
    }
}
