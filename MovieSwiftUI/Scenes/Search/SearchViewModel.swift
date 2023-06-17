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
        var cancelTrigger = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var filterMovieArray = [Movie]()
        @Published var filterGenreArray = [Genre]() {
            didSet {
                let selectedGenreArray = filterGenreArray.filter { genre in
                    genre.selected
                }.map { genre in
                    genre.id
                }
                genreSelectedIDSet = Set(selectedGenreArray)
            }
        }
        var genreSelectedIDSet = Set<Int>()
        @Published var searchData = ""
    }
    
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        // MARK: - Get data
        let genreArrayPublisher = input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .share()
        
        let searchTriggerPublisher = input.searchTrigger
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .flatMap {
                self.useCase.searchMovie(query: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .share()
        
        let filterGenreArrayPublisher = input.genreSelectedTrigger
            .compactMap { genre -> Int? in
                output.filterGenreArray.firstIndex(of: genre)
            }.map { genreIndex in
                var selectedGenre = output.filterGenreArray[genreIndex]
                selectedGenre.selected.toggle()
                output.filterGenreArray[genreIndex] = selectedGenre
                return output.filterGenreArray
            }
        
        // MARK: - Use data
        genreArrayPublisher
            .assign(to: \.filterGenreArray, on: output)
            .store(in: cancelBag)
        
        filterGenreArrayPublisher
            .assign(to: \.filterGenreArray, on: output)
            .store(in: cancelBag)
                
        input.genreSelectedTrigger.combineLatest(searchTriggerPublisher)
            .map { _, originMovieArray in
                originMovieArray.filter { movie in
                    output.genreSelectedIDSet.isSubset(of: movie.genreIDS)
                }
            }
            .assign(to: \.filterMovieArray, on: output)
            .store(in: cancelBag)
        
        searchTriggerPublisher
            .map { movieArray in
                movieArray.filter { movie in
                    output.genreSelectedIDSet.isSubset(of: movie.genreIDS)
                }
            }
            .assign(to: \.filterMovieArray, on: output)
            .store(in: cancelBag)
        
        // MARK: - Setup Action
        input.backTrigger
            .sink {
                navigator.popToPrevious()
            }
            .store(in: cancelBag)
        
        input.movieAction
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        
        input.cancelTrigger.combineLatest(genreArrayPublisher)
            .map { _, originGenreArray in
                return originGenreArray
            }
            .assign(to: \.filterGenreArray, on: output)
            .store(in: cancelBag)
        
        input.cancelTrigger
            .map {
                return String()
            }
            .assign(to: \.searchData, on: output)
            .store(in: cancelBag)
        
        input.cancelTrigger
            .map { _ in
                return [Movie]()
            }
            .assign(to: \.filterMovieArray, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
