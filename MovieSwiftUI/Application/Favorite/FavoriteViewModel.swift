//
//  FavoriteViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import Combine
import Foundation

struct FavoriteViewModel: ViewModel {
    
    class Input: ObservableObject {
        @Published var removeAction: MovieItem?
        var confirmRemoveMovieAction = PassthroughSubject<Void, Never>()
        @Published var isEditing = false
        var loadTrigger = PassthroughSubject<Void, Never>()
        @Published var searchAction = false
    }
    
    class Output: ObservableObject {
        @Published var showDialogConfirm = false
        @Published var movieFavoriteList = [MovieItem]()
    }
    
    let movieFavoriteRepository: MovieFavoriteRepositoryType = MovieFavoriteRepository(coreDataManager: .shared)
    let navigator: FavoriteNavigatorType
}

extension FavoriteViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let activityTracker = ActivityTracker(true)
        let errorTracker = ErrorTracker()
        
        input.$removeAction
            .unwrap()
            .map { _ in
                true
            }
            .assign(to: \.showDialogConfirm, on: output)
            .store(in: cancelBag)
        
        input.$searchAction
            .dropFirst()
            .sink { _ in
                navigator.toSearchScreen()
            }
            .store(in: cancelBag)
        
       let removeActionPublisher = Publishers.Zip(input.confirmRemoveMovieAction, input.$removeAction.unwrap())
            .map { $1 }
            .flatMap { movie in
                movieFavoriteRepository.findMovie(with: movie.movieID)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .flatMap { movieArray in
                movieArray.publisher
            }
            .handleEvents(receiveOutput: { movie in
                movieFavoriteRepository.delete(object: movie)
            })
            .map { _ in
                return Void()
            }
        
        Publishers.Merge(removeActionPublisher, input.loadTrigger)
            .flatMap { _ in
                movieFavoriteRepository
                    .getItemList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .flatMap { movieList in
                movieList.publisher
            }
            .map { movieFavorite in
                MovieItemTranslator.from(movie: movieFavorite)
            }
            .collect(.byTime(RunLoop.main, 0.1))
            .assign(to: \.movieFavoriteList, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
