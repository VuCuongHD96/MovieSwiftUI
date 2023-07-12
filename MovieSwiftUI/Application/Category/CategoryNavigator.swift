//
//  GenreNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 01/05/2023.
//

import UIKit
import SwiftUI

protocol GenreNavigatorType {
    func toSearchScreen()
    func toMovieByGenreScreen(genre: Genre)
}

struct GenreNavigator: GenreNavigatorType {

    let navigationController: UINavigationController
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let searchView = SearchView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: searchView)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieByGenreScreen(genre: Genre) {
        let navigator = MovieByGenreNavigator(navigationController: navigationController)
        let useCase = MovieByGenreUseCase()
        let viewModel = MovieByGenreViewModel(navigator: navigator, useCase: useCase, genre: genre)
        let movieByGenreView = MovieByGenreView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: movieByGenreView)
        navigationController.pushViewController(viewController, animated: true)
    }
}
