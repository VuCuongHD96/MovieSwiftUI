//
//  SearchUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import Foundation

protocol SearchUseCaseType {
    func searchMovie(query: String) -> Observable<[Movie]>
}

struct SearchUseCase: SearchUseCaseType {
    
    let movieRepository = MovieRepository(api: .share)
    
    func searchMovie(query: String) -> Observable<[Movie]> {
        movieRepository.searchMovie(query: query)
    }
}
