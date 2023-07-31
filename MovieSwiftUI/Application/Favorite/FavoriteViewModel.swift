//
//  FavoriteViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import Combine

struct FavoriteViewModel: ViewModel {
    
    class Input: ObservableObject {
        var removeClickAction = PassthroughSubject<MovieItem, Never>()
        var confirmRemoveMovieAction = PassthroughSubject<Void, Never>()
        @Published var editing = false
        var loadTrigger = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var showDialogConfirm = false
        @Published var movieFavoriteList = [MovieItem]()
    }
}

extension FavoriteViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.removeClickAction
            .map { _ in
                true
            }
            .assign(to: \.showDialogConfirm, on: output)
            .store(in: cancelBag)
        
        Publishers.CombineLatest(input.confirmRemoveMovieAction, input.removeClickAction)
            .map { $1 }
            .sink(receiveValue: { movie in
                // MARK: - todo delete movie
            })
            .store(in: cancelBag)
        
        input.loadTrigger
            .flatMap { _ in
                MovieFavoriteRepository(coreDataManager: .shared)
                    .getItemList()
                    .asDriver()
            }
        // MARK: - use combine to split movie
            .map { movieList in
                movieList.map { movieFavorite in
                    MovieItemTranslator.from(movie: movieFavorite)
                }
            }
            .assign(to: \.movieFavoriteList, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
