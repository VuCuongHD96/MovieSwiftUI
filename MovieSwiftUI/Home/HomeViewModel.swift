//
//  HomeViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

struct HomeViewModel: ViewModel {
    struct Input {
        var loadTrigger: Driver<Void>
    }
    
    class Output: ObservableObject {
        @Published var firstMovieArray = [Movie]()
        @Published var secondMovieArray = [Movie]()
    }
    
    let navigator: HomeNavigatorType
    let useCase: HomeUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        input.loadTrigger
            .flatMap {
                self.useCase.getMovieList(page: 1, movieType: .nowPlaying)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.firstMovieArray, on: output)
            .store(in: cancelBag)
        input.loadTrigger
            .flatMap {
                self.useCase.getMovieList(page: 1, movieType: .topRated)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.secondMovieArray, on: output)
            .store(in: cancelBag)
        return output
    }
}
