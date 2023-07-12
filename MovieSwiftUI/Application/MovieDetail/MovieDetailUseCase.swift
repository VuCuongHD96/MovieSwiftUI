//
//  MovieDetailUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 22/06/2023.
//

import Foundation

protocol MovieDetailUseCaseType {
    func getMovieDetail(movie: Movie) -> Observable<Movie>
    func getCredit(movie: Movie) -> Observable<[Person]>
}

struct MovieDetailUseCase: MovieDetailUseCaseType {
    let movieRepository = MovieRepository(api: .share)
    let creditRepository = CreditRepository(api: .share)
    
    func getMovieDetail(movie: Movie) -> Observable<Movie> {
        return movieRepository.getMovieDetail(movie: movie)
    }
    
    func getCredit(movie: Movie) -> Observable<[Person]> {
        return creditRepository.getCredit(movie: movie)
    }
}
