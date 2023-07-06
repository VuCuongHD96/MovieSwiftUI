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
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [Movie]()
    }
    
    let movieByGenreUseCase: MovieByGenreUseCaseType
    let genre: Genre
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let activityTracker = ActivityTracker(false)
        let errorTracker = ErrorTracker()
        let output = Output()
        input.loadTrigger
            .flatMap { _ in
                self.movieByGenreUseCase.getMovieList(by: genre)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        return output
    }
}
