//
//  AppViewModel.swift
//  MovieMVVM
//
//  Created by admin on 8/26/21.
//

import Foundation

struct AppViewModel {
    
    let navigator: AppNavigator
}

extension AppViewModel {
    
    func toMainView() {
        navigator.toMainView()
    }
    
    func toTabbar() {
        navigator.toTabbar()
    }
}
