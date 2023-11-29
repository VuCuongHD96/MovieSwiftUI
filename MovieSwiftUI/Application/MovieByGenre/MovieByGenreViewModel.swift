//
//  MovieByGenreViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 06/07/2023.
//

import Combine

struct MovieByGenreViewModel: ViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = Driver.just(Void())
        var movieAction = PassthroughSubject<MovieItem, Never>()
        @Published var backAction: Void?
        @Published var searchAction: Void?
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [MovieItem]()
        @Published var alertMessage = AlertMessage()
    }
    
    let navigator: MovieByGenreNavigatorType
    let useCase: MovieByGenreUseCaseType
    let genre: Genre
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let activityTracker = ActivityTracker(false)
        let errorTracker = ErrorTracker()
        let output = Output()
        
        errorTracker
            .map {
                AlertMessage(error: $0)
            }
            .assign(to: \.alertMessage, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                self.useCase.getMovieList(by: genre)
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
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        input.movieAction
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        input.$backAction
            .unwrap()
            .sink { _ in
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        input.$searchAction
            .unwrap()
            .sink { _ in
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        return output
    }
}
