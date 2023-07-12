//
//  TabbarNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 05/07/2023.
//

import UIKit

protocol TabbarNavigatorType {
    func createFavoriteViewModel() -> FavoriteViewModel
    func createHomeViewModel() -> HomeViewModel
    func createGenreViewModel() -> GenreViewModel
}

struct TabbarNavigator: TabbarNavigatorType {
    
    let navigationController: UINavigationController
    
    func createFavoriteViewModel() -> FavoriteViewModel {
        let navigator = FavoriteNavigator(navigationController: navigationController)
        let favoriteViewModel = FavoriteViewModel(navigator: navigator)
        return favoriteViewModel
    }
    
    func createHomeViewModel() -> HomeViewModel {
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let homeViewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        return homeViewModel
    }
    
    func createGenreViewModel() -> GenreViewModel {
        let navigator = GenreNavigator(navigationController: navigationController)
        let useCase = GenreUseCase()
        let genreViewModel = GenreViewModel(navigator: navigator, useCase: useCase)
        return genreViewModel
    }
}
