//
//  SearchViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import Combine
import SwiftUI

struct SearchViewModel: ViewModel {
    
    class Input: ObservableObject {
        var backTrigger = PassthroughSubject<Void, Never>()
        var searchTrigger = PassthroughSubject<String, Never>()
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [Movie]()
    }
    
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        input.backTrigger
            .sink {
                navigator.popToPrevious()
            }
            .store(in: cancelBag)
        input.searchTrigger
            .debounce(for: 1, scheduler: DispatchQueue.main)
            .flatMap {
                self.useCase.searchMovie(query: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        return output
    }
}
