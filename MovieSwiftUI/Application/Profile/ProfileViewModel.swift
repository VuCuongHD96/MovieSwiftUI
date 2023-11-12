//
//  ProfileViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 06/11/2023.
//

import Combine

struct ProfileViewModel {
    
    struct Input {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var backTrigger = PassthroughSubject<Void, Never>()
        var searchAction = PassthroughSubject<Void, Never>()
        var movieAction = PassthroughSubject<Movie, Never>()
    }
    
    class Output: ObservableObject {
        @Published var profile = Profile()
        @Published var movieList = [Movie]()
    }
    
    let navigator: ProfileNavigatorType
    let useCase: ProfileUseCaseType
    let profileID: Int
    let movieDidSelected: PassthroughSubject<Movie, Never>
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
            .assign(to: \.movieList, on: output)
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
        
        return output
    }
}
