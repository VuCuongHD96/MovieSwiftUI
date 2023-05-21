//
//  TabbarViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import UIKit

protocol TabbarViewModelType {
    
    // MARK: - Define
    typealias Listener = (TabbarViewModelType) -> Void
    
    // MARK: - Property
    var dataDidChange: Listener? { get }
    var viewControllers: [UIViewController] { get }
}

final class TabbarViewModel: TabbarViewModelType {
    
    let navigator: TabbarNavigatorType
    
    var dataDidChange: Listener?
    var viewControllers = [UIViewController]() {
        didSet {
            dataDidChange?(self)
        }
    }
    
    init(navigator: TabbarNavigatorType) {
        self.navigator = navigator
    }
}

extension TabbarViewModel {
    
    func showData() {
        let movieScreen = navigator.createHomeScreen()
        let genreScreen = navigator.createGenreScreen()
        viewControllers = [movieScreen, genreScreen]
    }
}
