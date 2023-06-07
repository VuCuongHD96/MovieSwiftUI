//
//  SearchNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import UIKit

protocol SearchNavigatorType {
    func popToPrevious()
}

struct SearchNavigator: SearchNavigatorType {
    
    unowned let navigationController: UINavigationController
    
    func popToPrevious() {
        navigationController.popViewController(animated: true)
    }
}
