//
//  MovieDetailViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 22/06/2023.
//

import Combine
import Foundation

struct MovieDetailViewModel {
    
    class Input: ObservableObject {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var backButtonSubject = PassthroughSubject<Void, Never>()
        var playButtonSubject = PassthroughSubject<Void, Never>()
        var castDetailSubject = PassthroughSubject<Person, Never>()
    }
    
    class Output: ObservableObject {
        @Published var movie: Movie = .defaultValue
        @Published var alert = AlertMessage()
        @Published var personArray = [Person]()
    }
    
    let navigator: MovieDetailNavigatorType
    let useCase: MovieDetailUseCaseType
    let movie: Movie
}

extension MovieDetailViewModel: ViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        input.loadTrigger
            .flatMap { _ in
                self.useCase.getMovieDetail(movie: movie)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.movie, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                self.useCase.getCredit(movie: movie)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.personArray, on: output)
            .store(in: cancelBag)
        
        input.backButtonSubject
            .sink {
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        
        input.playButtonSubject
            .sink {
                navigator.showListTrailer()
            }
            .store(in: cancelBag)
        
        input.castDetailSubject
            .sink { person in
                navigator.toCastScreen(person: person)
            }
            .store(in: cancelBag)
        
        errorTracker
            .receive(on: RunLoop.main)
            .map { AlertMessage(error: $0) }
            .assign(to: \.alert, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
