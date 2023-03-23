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
        let viewController = UIHostingController(rootView: SearchView())
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func toMovieByGenreScreen() {
        let viewController = UIHostingController(rootView: MovieByGenreScreen())
        navigationController.pushViewController(viewController, animated: true)
    }
}
