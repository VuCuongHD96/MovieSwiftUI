//
//  HomeViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Combine
import Foundation

struct HomeViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = Driver.just(Void())
        var searchAction = PassthroughSubject<Void, Never>()
        @Published var movieSelectedTrigger: MovieItem?
    }
    
    class Output: ObservableObject {
        @Published var firstMovieArray = [MovieItem]()
        @Published var secondMovieArray = [MovieItem]()
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
            .flatMap { movieList in
                Publishers.Sequence(sequence: movieList)
            }
            .map { movie in
                MovieItemTranslator.from(movie: movie)
            }
            .collect()
            .assign(to: \.firstMovieArray, on: output)
            .store(in: cancelBag)
        input.loadTrigger
            .flatMap {
                self.useCase.getMovieList(page: 1, movieType: .topRated)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .flatMap { movieList in
                Publishers.Sequence(sequence: movieList)
            }
            .map { movie in
                MovieItemTranslator.from(movie: movie)
            }
            .collect()
            .assign(to: \.secondMovieArray, on: output)
            .store(in: cancelBag)
        input.searchAction
            .sink {
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        input.$movieSelectedTrigger
            .unwrap()
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        return output
    }
}
