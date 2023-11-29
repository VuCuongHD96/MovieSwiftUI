//
//  ProfileViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 06/11/2023.
//

import Combine
import Foundation

struct ProfileViewModel {
    
    struct Input {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var backTrigger = PassthroughSubject<Void, Never>()
        var searchAction = PassthroughSubject<Void, Never>()
        var movieAction = PassthroughSubject<MovieItem, Never>()
    }
    
    class Output: ObservableObject {
        @Published var profile = Profile()
        @Published var movieItemList = [MovieItem]()
        @Published var alertMessage = AlertMessage()
    }
    
    let navigator: ProfileNavigatorType
    let useCase: ProfileUseCaseType
    let profileID: Int
    let movieDidSelected: PassthroughSubject<MovieItem, Never>
}

extension ProfileViewModel: ViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let activity = ActivityTracker(true)
        let error = ErrorTracker()

        input.loadTrigger
            .flatMap { _ in
                useCase.getProfile(by: profileID)
                    .trackActivity(activity)
                    .trackError(error)
                    .asDriver()
            }
            .assign(to: \.profile, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                useCase.getMovieList(by: profileID)
                    .trackActivity(activity)
                    .trackError(error)
                    .asDriver()
            }
            .flatMap { movieList in
                Publishers.Sequence(sequence: movieList)
            }
            .map { movie in
                MovieItemTranslator.from(movie: movie)
            }
            .collect()
            .assign(to: \.movieItemList, on: output)
            .store(in: cancelBag)
        
        input.backTrigger
            .sink { _ in
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        
        input.searchAction
            .sink {
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        
        input.movieAction
            .sink { movieProfileSelected in
                movieDidSelected.send(movieProfileSelected)
                navigator.backToPrevious()
            }
            .store(in: cancelBag)
        
        error.map { error in
            AlertMessage(error: error)
        }
        .assign(to: \.alertMessage, on: output)
        .store(in: cancelBag)
        
        return output
    }
}
