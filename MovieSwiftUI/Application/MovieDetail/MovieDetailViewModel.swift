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
        var loadTrigger = Driver.just(Void())
        var backButtonSubject = PassthroughSubject<Void, Never>()
        var playButtonSubject = PassthroughSubject<Void, Never>()
        @Published var selectedPersonTrigger: Person?
        @Published var backTrigger: Void?
        @Published var playTrigger: Movie?
        @Published var isFavorite: Bool?
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
        
        input.$backTrigger
            .unwrap()
            .sink { _ in
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        
        input.$playTrigger
            .unwrap()
            .sink { movie in
                navigator.showListTrailer(movie: movie)
            }
            .store(in: cancelBag)
        
        input.$selectedPersonTrigger
            .unwrap()
            .sink { person in
                navigator.toCastScreen(person: person)
            }
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                useCase.getMovieFavorite()
            }
            .sink { a in
                print("---- a = ", a)
            } receiveValue: { array in
                print("---- array = ", array)
            }
            .store(in: cancelBag)
        
        input.$isFavorite
            .sink { value in
                print("--- debug ---- value = ", value)
                
                useCase.saveMovie()
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
