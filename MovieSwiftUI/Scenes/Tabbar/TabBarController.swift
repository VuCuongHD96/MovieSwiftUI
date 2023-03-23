//
//  TabBarController.swift
//  MovieSwiftUI
//
//  Created by Work on 02/05/2023.
//

import UIKit
import SwiftUI

class TabBarController: UITabBarController {
    
    // MARK: - Property
    var viewModel: TabbarViewModel! {
        didSet {
            viewModel.dataDidChange = { [unowned self] _ in
                bindViewModel()
            }
        }
    }
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    // MARK: - View
    private func setupView() {
        tabBar.tintColor = UIColor.systemPink
        guard let navigationController = navigationController else {
            return
        }
        navigationController.isNavigationBarHidden = true
        let navigator = TabbarNavigator(navigationController: navigationController)
        viewModel = TabbarViewModel(navigator: navigator)
        viewModel.showData()
    }
    
    // MARK: - Bind Data
    private func bindViewModel() {
        viewControllers = viewModel.viewControllers
    }
}
