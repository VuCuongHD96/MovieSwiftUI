//
//  MovieByGenreViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 06/07/2023.
//

import Combine

struct MovieByGenreViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var movieAction = PassthroughSubject<Movie, Never>()
        var backAction = PassthroughSubject<Void, Never>()
        var searchAction = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [Movie]()
    }
    
    let navigator: MovieByGenreNavigatorType
    let useCase: MovieByGenreUseCaseType
    let genre: Genre
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let activityTracker = ActivityTracker(false)
        let errorTracker = ErrorTracker()
        let output = Output()
        input.loadTrigger
            .flatMap { _ in
                self.useCase.getMovieList(by: genre)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        input.movieAction
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        input.backAction
            .sink { _ in
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        input.searchAction
            .sink { _ in
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        return output
    }
}
