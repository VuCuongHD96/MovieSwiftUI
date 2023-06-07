//
//  CategoryNavigatorType.swift
//  MovieSwiftUI
//
//  Created by Work on 01/05/2023.
//

import UIKit
import SwiftUI

protocol CategoryNavigatorType {
    func toSearchScreen()
    func toMovieByGenreScreen()
}

struct GenreNavigator: CategoryNavigatorType {

    unowned let navigationController: UINavigationController
    
    func toSearchScreen() {
        let navigator = SearchNavigator(navigationController: navigationController)
        let useCase = SearchUseCase()
        let viewModel = SearchViewModel(navigator: navigator, useCase: useCase)
        let searchView = SearchView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: searchView)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieByGenreScreen() {
        let viewController = UIHostingController(rootView: MovieByGenreScreen())
        navigationController.pushViewController(viewController, animated: true)
    }
}
