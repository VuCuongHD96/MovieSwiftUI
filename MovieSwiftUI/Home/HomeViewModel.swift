//
//  HomeViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Combine

struct HomeViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger: Driver<Void>
        var searchAction = PassthroughSubject<Void, Never>()
        var movieAction = PassthroughSubject<Movie, Never>()
        
        init(loadTrigger: Driver<Void>) {
            self.loadTrigger = loadTrigger
        }
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
        input.searchAction
            .sink {
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        input.movieAction
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        return output
    }
}
