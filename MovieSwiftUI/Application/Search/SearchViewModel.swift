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
        @Published var backAction: Void?
        @Published var searchData = ""
        var loadTrigger = PassthroughSubject<Void, Never>()
        @Published var genreIndexSelectedAction: Int?
        @Published var cancelAction: Void?
        @Published var movieSelected: Movie?
    }
    
    class Output: ObservableObject {
        @Published var movieArray = [Movie]()
        @Published var genreArray = [Genre]()
        var genreSelectedIDSet = Set<Int>()
    }
    
    let navigator: SearchNavigatorType
    let useCase: SearchUseCaseType
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        
        output.$genreArray
            .removeDuplicates()
            .map { genreArray in
                let genreIDArray = genreArray
                    .filter { $0.selected }
                    .map { $0.id }
                return Set(genreIDArray)
            }
            .assign(to: \.genreSelectedIDSet, on: output)
            .store(in: cancelBag)
        
        input.$genreIndexSelectedAction
            .unwrap()
            .map { index -> [Genre] in
                var genreSelected = output.genreArray[index]
                genreSelected.selected.toggle()
                output.genreArray[index] = genreSelected
                return output.genreArray
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        let genreArrayPublisher = input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .share()
        
        let searchResult = input.$searchData
            .removeDuplicates()
            .debounce(for: 0.5, scheduler: DispatchQueue.main)
            .flatMap {
                self.useCase.searchMovie(query: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .share()
        
        input.$genreIndexSelectedAction
            .combineLatest(searchResult)
            .map { _, originMovieArray in
                originMovieArray.filter { movie in
                    return output.genreSelectedIDSet.isSubset(of: movie.genreIDSUnwrapped)
                }
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        
        genreArrayPublisher
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        searchResult
            .map { movieArray in
                return movieArray.filter { movie in
                    output.genreSelectedIDSet.isSubset(of: movie.genreIDSUnwrapped)
                }
            }
            .assign(to: \.movieArray, on: output)
            .store(in: cancelBag)
        
        input.$backAction
            .unwrap()
            .sink {
                navigator.popToPrevious()
            }
            .store(in: cancelBag)
        
        input.$cancelAction
            .unwrap()
            .combineLatest(genreArrayPublisher)
            .map { _, originGenreArray in
                return originGenreArray
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        
        input.$cancelAction
            .unwrap()
            .sink {
                input.searchData = String()
                output.movieArray.removeAll()
            }
            .store(in: cancelBag)
        
        input.$movieSelected
            .unwrap()
            .sink { movie in
                navigator.toMovieDetailScreen(movie: movie)
            }
            .store(in: cancelBag)
        
        return output
    }
}
