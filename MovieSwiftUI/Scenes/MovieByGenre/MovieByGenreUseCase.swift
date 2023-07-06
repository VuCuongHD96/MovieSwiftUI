//
//  MovieByGenreUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 01/07/2023.
//

import Foundation

protocol MovieByGenreUseCaseType {
    func getMovieList(by genre: Genre) -> Observable<[Movie]>
}

final class MovieByGenreUseCase: MovieByGenreUseCaseType {
    
    private let movieRepository = MovieRepository(api: APIService.share)
    
    func getMovieList(by genre: Genre) -> Observable<[Movie]> {
        return movieRepository.getMovieList(by: genre)
    }
}
