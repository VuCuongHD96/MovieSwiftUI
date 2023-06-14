//
//  SearchViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import Combine
import SwiftUI

struct SearchViewModel: ViewModel {
    
    class Input: ObservableObject {
        var backTrigger = PassthroughSubject<Void, Never>()
        var searchTrigger = PassthroughSubject<String, Never>()
        var loadTrigger = PassthroughSubject<Void, Never>()
        var movieAction = PassthroughSubject<Movie, Never>()
        var genreSelectedTrigger = PassthroughSubject<Genre, Never>()
    }
    
    class Output: ObservableObject {
        var originMovieArray = [Movie]()
        @Published var filterMovieArray = [Movie]()
        @Published var genreArray = [Genre]()
        @Published var genreIDSelectedArray = 0
        var genreSelectedIDSet = Set<Int>()
    }
    
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        // MARK: - LoadTrigger
        input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        // MARK: - Back Trigger
        input.backTrigger
            .sink {
                navigator.popToPrevious()
            }
            .store(in: cancelBag)
        
        // MARK: - Search Trigger
        let searchTriggerCancellable = input.searchTrigger
            .filter {
                !$0.isEmpty
            }
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .flatMap {
                self.useCase.searchMovie(query: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .share()
        
        searchTriggerCancellable
            .assign(to: \.originMovieArray, on: output)
            .store(in: cancelBag)
        
        searchTriggerCancellable
            .map { movieArray in
                movieArray.filter { movie in
                    output.genreSelectedIDSet.isSubset(of: movie.genreIDS)
                }
            }
            .assign(to: \.filterMovieArray, on: output)
            .store(in: cancelBag)
        
        // MARK: - Movie Action
        input.movieAction
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        
        // MARK: - Genre Trigger
        input.genreSelectedTrigger
            .compactMap { genre -> Int? in
                output.genreArray.firstIndex(of: genre)
            }.map { genreIndex in
                var selectedGenre = output.genreArray[genreIndex]
                selectedGenre.selected.toggle()
                output.genreArray[genreIndex] = selectedGenre
                return output.genreArray
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        let genreSelectedIDSetPublisher = input.genreSelectedTrigger
            .map {
                $0.id
            }
            .map { genreID in
                if output.genreSelectedIDSet.contains(genreID) {
                    output.genreSelectedIDSet.remove(genreID)
                } else {
                    output.genreSelectedIDSet.insert(genreID)
                }
                return output.genreSelectedIDSet
            }
            .share()
        
        genreSelectedIDSetPublisher
            .assign(to: \.genreSelectedIDSet, on: output)
            .store(in: cancelBag)
        
        genreSelectedIDSetPublisher
            .map { genreSelectedIDSet in
                output.originMovieArray.filter { movie in
                    genreSelectedIDSet.isSubset(of: movie.genreIDS)
                }
            }
            .assign(to: \.filterMovieArray, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
