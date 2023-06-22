//
//  SearchNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import UIKit
import SwiftUI

protocol SearchNavigatorType {
    func popToPrevious()
    func toMovieDetailScreen(movie: Movie)
}

struct SearchNavigator: SearchNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func toMovieDetailScreen(movie: Movie) {
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let useCase = MovieDetailUseCase()
        let viewModel = MovieDetailViewModel(navigator: navigator, useCase: useCase, movie: movie)
        let movieDetailView = MovieDetailView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: movieDetailView)
        navigationController.pushViewController(viewController, animated: true)
    }
}
