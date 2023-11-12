//
//  ProfileNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 12/11/2023.
//

import UIKit
import SwiftUI

protocol ProfileNavigatorType {
    
    func backToPrevious()
    func toSearchScreen()
}

struct ProfileNavigator: ProfileNavigatorType {
    
    let navigationController: UINavigationController
    
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
