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
    }
    
    class Output: ObservableObject {
        @Published var profile = Profile()
        @Published var movieList = [Movie]()
    }
    
    let profileUseCase: ProfileUseCaseType
    let profileID: Int
}

extension ProfileViewModel: ViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let activity = ActivityTracker(true)
        let error = ErrorTracker()
        
        input.loadTrigger
            .flatMap { _ in
                profileUseCase.getProfile(by: profileID)
                    .trackActivity(activity)
                    .trackError(error)
                    .asDriver()
            }
            .assign(to: \.profile, on: output)
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                profileUseCase.getMovieList(by: profileID)
                    .trackActivity(activity)
                    .trackError(error)
                    .asDriver()
            }
            .assign(to: \.movieList, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
