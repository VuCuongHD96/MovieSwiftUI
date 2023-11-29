//
//  TrailerUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 23/09/2023.
//

import Combine

protocol TrailerUseCaseType {
    
    func getTrailerList(movie: MovieItem) -> Observable<[Trailer]>
}

struct TrailerUseCase: TrailerUseCaseType {
    
    private let trailerRepository = TrailerRepository(api: .share)
    
    func getTrailerList(movie: MovieItem) -> Observable<[Trailer]> {
        return trailerRepository.getTrailerList(movie: movie)
    }
}
