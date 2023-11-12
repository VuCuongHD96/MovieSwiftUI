//
//  MovieDetailNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 22/06/2023.
//

import SwiftUI
import UIKit
import Combine

protocol MovieDetailNavigatorType {
    func backToPrevious()
    func showListTrailer(movie: Movie)
    func toProfileScreen(person: Person, movieDidSelected: PassthroughSubject<Movie, Never>)
}

struct MovieDetailNavigator: MovieDetailNavigatorType {
    
    let navigationController: UINavigationController
    
    func backToPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func showListTrailer(movie: Movie) {
        let trailerUseCase = TrailerUseCase()
        let viewModel = TrailerViewModel(trailerUseCase: trailerUseCase, movie: movie)
        let trailerView = TrailerView(viewModel: viewModel)
        let trailerViewController = UIHostingController(rootView: trailerView)
        trailerViewController.view.backgroundColor = .gray.withAlphaComponent(0.7)
        trailerViewController.modalPresentationStyle = .overFullScreen
        navigationController.present(trailerViewController, animated: true)
    }
    
    func toProfileScreen(person: Person, movieDidSelected: PassthroughSubject<Movie, Never>) {
        let profileUseCase = ProfileUseCase()
        let profileNavigator = ProfileNavigator(navigationController: navigationController)
        let viewModel = ProfileViewModel(navigator: profileNavigator, useCase: profileUseCase, profileID: person.id, movieDidSelected: movieDidSelected)
        let profileView = ProfileView(viewModel: viewModel)
        let profileViewController = UIHostingController(rootView: profileView)
        navigationController.pushViewController(profileViewController, animated: true)
    }
}
