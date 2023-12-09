//
//  FavoriteNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 04/12/2023.
//

import UIKit
import SwiftUI

protocol FavoriteNavigatorType {
    
    func toSearchScreen()
    func toMovieDetailScreen(movie: MovieItem)
}

struct FavoriteNavigator: FavoriteNavigatorType {
    
    let navigationController: UINavigationController
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let searchView = SearchView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: searchView)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieDetailScreen(movie: MovieItem) {
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let useCase = MovieDetailUseCase()
        let viewModel = MovieDetailViewModel(navigator: navigator, useCase: useCase, movie: movie)
        let movieDetailView = MovieDetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: movieDetailView)
        navigationController.pushViewController(viewController, animated: true)
    }
}
