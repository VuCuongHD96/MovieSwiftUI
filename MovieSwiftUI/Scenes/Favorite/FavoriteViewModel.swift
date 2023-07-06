//
//  FavoriteViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 05/07/2023.
//

import Combine

struct FavoriteViewModel: ViewModel {
    
    class Input: ObservableObject {
        var searchAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        
    }
    
    let navigator: FavoriteNavigatorType// = FavoriteNavigator()
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        input.searchAction
            .sink { _ in
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        return output
    }
}
