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
    func getMovieFavorite() -> Observable<[MovieFavorite]>
    func saveMovie() -> Observable<Bool>
}

struct MovieDetailUseCase: MovieDetailUseCaseType {
    let movieRepository = MovieRepository(api: .share)
    let creditRepository = CreditRepository(api: .share)
    let movieFavoriteRepository = MovieFavoriteRepository(coreDataManager: .shared)
    
    func getMovieDetail(movie: Movie) -> Observable<Movie> {
        return movieRepository.getMovieDetail(movie: movie)
    }
    
    func getCredit(movie: Movie) -> Observable<[Person]> {
        return creditRepository.getCredit(movie: movie)
    }
    
//    func isMovieFavorite(movie: Movie) -> Observable<Bool> {
//        movieFavoriteRepository.
//    }
    
    func getMovieFavorite() -> Observable<[MovieFavorite]> {
        movieFavoriteRepository.getItemList()
    }
    
    func saveMovie() -> Observable<Bool> {
        return movieFavoriteRepository.save()
    }
}
