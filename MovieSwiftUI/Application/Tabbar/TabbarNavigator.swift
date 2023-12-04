//
//  TabbarNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import SwiftUI

protocol TabbarNavigatorType {
    func createHomeScreen() -> UIViewController
    func createGenreScreen() -> UIViewController
    func createFavoriteScreen() -> UIViewController
}

struct TabbarNavigator: TabbarNavigatorType {
    
    let navigationController: UINavigationController
    
    private func createHomeTabbarItem() -> UITabBarItem {
        let homeImage = UIImage(named: "Movie")?.withRenderingMode(.alwaysOriginal)
        let homeSelectedImage = UIImage(named: "MovieSelected")?.withRenderingMode(.alwaysOriginal)
        let tabbarItem = UITabBarItem(title: "MOVIE", image: homeImage, selectedImage: homeSelectedImage)
        return tabbarItem
    }
    
    func createHomeScreen() -> UIViewController {
        let navigator = HomeNavigator(navigationController: navigationController)
        let useCase = HomeUseCase()
        let homeViewModel = HomeViewModel(navigator: navigator, useCase: useCase)
        let homeView = HomeView(homeViewModel: homeViewModel)
        let homeViewController = UIHostingController(rootView: homeView)
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
    
    func createFavoriteScreen() -> UIViewController {
        let navigator = FavoriteNavigator(navigationController: navigationController)
        let viewModel = FavoriteViewModel(navigator: navigator)
        let favoriteView = FavoriteView(viewModel: viewModel)
        let favoriteViewController = UIHostingController(rootView: favoriteView)
        favoriteViewController.tabBarItem = createFavoriteTabbarItem()
        return favoriteViewController
    }
}
