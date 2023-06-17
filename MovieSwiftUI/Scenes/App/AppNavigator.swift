//
//  AppNavigator.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import UIKit
import SwiftUI

protocol AppNavigatorType {
    func toMainView()
}

struct AppNavigator: AppNavigatorType {
    
    unowned let window: UIWindow!
    
    func toMainView() {
        let navigationController = UINavigationController()
        navigationController.navigationBar.isHidden = true
        let navigator = WalkThoughtListNavigator(navigationController: navigationController)
        let viewModel = WalkThoughtListViewModel(navigator: navigator)
        let view = WalkThoughtListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
