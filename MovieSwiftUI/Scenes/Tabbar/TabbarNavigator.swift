//
//  TabbarNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import SwiftUI

protocol TabbarNavigatorType {
    func createMovieScreen() -> UIViewController
    func createGenreScreen() -> UIViewController
}

struct TabbarNavigator: TabbarNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    private func createHomeTabbarItem() -> UITabBarItem {
        let homeImage = UIImage(named: "Movie")?.withRenderingMode(.alwaysOriginal)
        let homeSelectedImage = UIImage(named: "MovieSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "MOVIE", image: homeImage, selectedImage: homeSelectedImage)
        return tabbarItem
    }
    
    func createMovieScreen() -> UIViewController {
        let homeViewController = UIHostingController(rootView: HomeView())
        homeViewController.tabBarItem = createHomeTabbarItem()
        return homeViewController
    }
    
    private func createGenreTabbarItem() -> UITabBarItem {
        let categoryImage = UIImage(named: "Category")?.withRenderingMode(.alwaysOriginal)
        let categorySelectedImage = UIImage(named: "CategorySelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "GENRE", image: categoryImage, selectedImage: categorySelectedImage)
        return tabbarItem
    }
    
    func createGenreScreen() -> UIViewController {
        let navigator = GenreNavigator(navigationController: navigationController)
        let useCase = GenreUseCase()
        let categoryViewModel = GenreViewModel(navigator: navigator, useCase: useCase)
        let categoryView = GenreView(categoryViewModel: categoryViewModel)
        let categoryViewController = UIHostingController(rootView: categoryView)
        categoryViewController.tabBarItem = createGenreTabbarItem()
        return categoryViewController
    }
    
    private func createFavoriteTabbarItem() -> UITabBarItem {
        let favoriteImage = UIImage(named: "Favorite")?.withRenderingMode(.alwaysOriginal)
        let favoriteSelectedImage = UIImage(named: "FavoriteSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "FAVORITE", image: favoriteImage, selectedImage: favoriteSelectedImage)
        return tabbarItem
    }
}
