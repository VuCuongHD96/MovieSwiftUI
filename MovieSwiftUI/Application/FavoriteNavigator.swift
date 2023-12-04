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
}
