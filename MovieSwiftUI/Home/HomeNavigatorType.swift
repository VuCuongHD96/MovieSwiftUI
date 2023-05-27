//
//  HomeNavigatorType.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import UIKit
import SwiftUI

protocol HomeNavigatorType {
    func toSearchScreen()
    func toMovieDetailScreen(movie: Movie)
}

struct HomeNavigator: HomeNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func toSearchScreen() {
        let viewController = UIHostingController(rootView: SearchView())
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieDetailScreen(movie: Movie) {
        let viewController = UIHostingController(rootView: MovieDetailView())
        navigationController.pushViewController(viewController, animated: true)
    }
}
