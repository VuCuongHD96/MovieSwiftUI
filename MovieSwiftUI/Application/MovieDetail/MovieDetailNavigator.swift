//
//  MovieDetailNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 22/06/2023.
//

import SwiftUI
import UIKit

protocol MovieDetailNavigatorType {
    func backToPrevious()
    func showListTrailer()
    func toCastScreen(person: Person)
}

struct MovieDetailNavigator: MovieDetailNavigatorType {
    
    let navigationController: UINavigationController
    
    func backToPrevious() {
        navigationController.popViewController(animated: true)
    }
    
    func showListTrailer() {
        let trailerView = TrailerView()
        let trailerViewController = UIHostingController(rootView: trailerView)
        trailerViewController.view.backgroundColor = .gray.withAlphaComponent(0.7)
        trailerViewController.modalPresentationStyle = .overFullScreen
        navigationController.present(trailerViewController, animated: true)
    }
    
    func toCastScreen(person: Person) {
        let castDetailView = CastDetailView()
        let castViewController = UIHostingController(rootView: castDetailView)
        navigationController.pushViewController(castViewController, animated: true)
    }
}
