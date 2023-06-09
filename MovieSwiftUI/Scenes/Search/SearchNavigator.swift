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
        let viewController = UIHostingController(rootView: MovieDetailView())
        navigationController.pushViewController(viewController, animated: true)
    }
}
