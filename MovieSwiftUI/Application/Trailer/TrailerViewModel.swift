//
//  TrailerViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 22/09/2023.
//

import Combine

struct TrailerViewModel {
    
    struct Input {
        var loadTrigger = PassthroughSubject<Void, Never>()
    }
    
    class Output: ObservableObject {
        @Published var trailerList = [Trailer]()
    }
    
    let trailerUseCase: TrailerUseCaseType
    let movie: Movie
}

extension TrailerViewModel: ViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        
        input.loadTrigger
            .flatMap { _ in
                trailerUseCase.getTrailerList(movie: movie)
                    .asDriver()
            }
            .assign(to: \.trailerList, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
