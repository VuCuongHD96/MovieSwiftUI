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
        let tabbarViewController = UIHostingController(rootView: TabbarView())
        navigationController.pushViewController(tabbarViewController, animated: true)
    }
}
