//
//  WalkThoughtListViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 22/04/2023.
//

import Combine

struct WalkThoughtListViewModel: ViewModel {
    
    let navigator: WalkThoughtListNavigatorType
    
    init(navigator: WalkThoughtListNavigatorType) {
        self.navigator = navigator
    }
    
    class Input: ObservableObject {
        var getStatedButtonDidTap = PassthroughSubject<Void, Never>()
        @Published var selectedIndex = 0
        var loadTrigger: Driver<Void>
        
        init(loadTrigger: Driver<Void>) {
            self.loadTrigger = loadTrigger
        }
    }
    
    class Output: ObservableObject {
        @Published var walkthroughArray = [WalkThough]()
    }
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.getStatedButtonDidTap
            .sink {
                navigator.toTabbar()
            }
            .store(in: cancelBag)
        
        input.loadTrigger
            .map { _ in
                return WalkThough.walkThoughArray
            }
            .assign(to: \.walkthroughArray, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
