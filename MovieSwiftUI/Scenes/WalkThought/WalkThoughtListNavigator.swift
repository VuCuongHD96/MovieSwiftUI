//
//  WalkThoughtListNavigator.swift
//  MovieSwiftUI
//
//  Created by Work on 22/04/2023.
//

import UIKit
import SwiftUI

protocol WalkThoughtListNavigatorType {
    func toTabbar()
}

struct WalkThoughtListNavigator: WalkThoughtListNavigatorType {
    
    let navigationController: UINavigationController
    
    func toTabbar() {
        navigationController.isNavigationBarHidden = true
        let navigator = TabbarNavigator(navigationController: navigationController)
        let tabbarView = TabbarView(navigator: navigator)
        let tabbarController = UIHostingController(rootView: tabbarView)
        navigationController.pushViewController(tabbarController, animated: true)
    }
}
