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
    func toTabbar()
}

struct AppNavigator: AppNavigatorType {
    
    unowned let window: UIWindow!
    
    func toMainView() {
        let navigationController = UINavigationController()
        let navigator = WalkThoughtListNavigator(navigationController: navigationController)
        let viewModel = WalkThoughtListViewModel(navigator: navigator)
        let view = WalkThoughtListView(viewModel: viewModel)
        let viewController = UIHostingController(rootView: view)
        navigationController.viewControllers = [viewController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    
    func toTabbar() {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        let navigator = TabbarNavigator(navigationController: navigationController)
        let tabbarView = TabbarView(navigator: navigator)
        let tabbarController = UIHostingController(rootView: tabbarView)
        navigationController.viewControllers = [tabbarController]
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
}
