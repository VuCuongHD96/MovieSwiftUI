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
    
    unowned let navigationController: UINavigationController
    
    func toTabbar() {
        navigationController.isNavigationBarHidden = true
        let storyBoard = UIStoryboard(name: "TabBar", bundle: nil)
        guard let viewController = storyBoard.instantiateViewController(withIdentifier: "TabBarController") as? TabBarController else {
            return
        }
        navigationController.pushViewController(viewController, animated: true)
    }
}
