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
        var loadTrigger = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [Movie]()
        @Published var genreArray = [Genre]()
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
            .filter {
                $0.isEmpty
            }
            .map { _ in
                return [Movie]()
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        
        input.searchTrigger
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .filter {
                !$0.isEmpty
            }
            .flatMap {
                self.useCase.searchMovie(query: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
