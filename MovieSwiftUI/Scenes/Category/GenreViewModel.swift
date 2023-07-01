//
//  GenreViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Combine
import Foundation

struct GenreViewModel: ViewModel {
    
    struct Input {
        var loadTrigger: Driver<Void>
        var searchButtonTapped = PassthroughSubject<Void, Never>()
        var genreItemTapped = PassthroughSubject<Genre, Never>()
    }
    
    class Output: ObservableObject {
        @Published var genreArray = [Genre]()
        @Published var alertMessage = AlertMessage()
        @Published var isLoading = false
    }
    
    let navigator: CategoryNavigatorType
    let useCase: GenreUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        let output = Output()
        input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        errorTracker
            .map {
                AlertMessage(error: $0)
            }
            .assign(to: \.alertMessage, on: output)
            .store(in: cancelBag)
        activityTracker
            .assign(to: \.isLoading, on: output)
            .store(in: cancelBag)
        input.searchButtonTapped
            .sink {
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        input.genreItemTapped
            .sink { genre in
                navigator.toMovieByGenreScreen(genre: genre)
            }
            .store(in: cancelBag)
        return output
    }
}
