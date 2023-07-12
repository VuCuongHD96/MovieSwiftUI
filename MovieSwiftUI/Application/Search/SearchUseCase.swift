//
//  SearchUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 30/05/2023.
//

import Foundation

protocol SearchUseCaseType {
    func searchMovie(query: String) -> Observable<[Movie]>
    func getGenreList() -> Observable<[Genre]>
}

struct SearchUseCase: SearchUseCaseType {
    
    let movieRepository = MovieRepository(api: .share)
    let genreRepository = GenreRepository(api: .share)
    
    func searchMovie(query: String) -> Observable<[Movie]> {
        movieRepository.searchMovie(query: query)
    }
    
    func getGenreList() -> Observable<[Genre]> {
        genreRepository.getGenreList()
    }
}
