//
//  MovieRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

protocol MovieRepositoryType {
    func getMovieList(page: Int, movieType: MovieType) -> Observable<[Movie]>
    func searchMovie(query: String) -> Observable<[Movie]>
    func getMovieDetail(movie: MovieItem) -> Observable<Movie>
    func getMovieList(by profileID: Int) -> Observable<[Movie]>
}

class MovieRepository: ServiceBaseRepository, MovieRepositoryType {
    
    func getMovieList(page: Int, movieType: MovieType) -> Observable<[Movie]> {
        let input = MovieRequest(page: page, movieType: movieType)
        return api.request(input: input)
            .map { (data: MovieResponse) -> [Movie] in
                data.results
            }
            .eraseToAnyPublisher()
    }
    
    func searchMovie(query: String) -> Observable<[Movie]> {
        let input = SearchRequest(query: query)
        return api.request(input: input)
            .map { (data: MovieResponse) -> [Movie] in
                data.results
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieDetail(movie: MovieItem) -> Observable<Movie> {
        let input = MovieRequest(movieID: movie.movieID)
        return api.request(input: input)
            .map { (data: Movie) -> Movie in
                return data
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieList(by genre: Genre) -> Observable<[Movie]> {
        let input = MovieRequest(genreID: genre.id)
        return api.request(input: input)
            .map { (data: MovieResponse) -> [Movie] in
                data.results
            }
            .eraseToAnyPublisher()
    }
    
    func getMovieList(by profileID: Int) -> Observable<[Movie]> {
        let input = MovieRequest(profileID: profileID)
        return api.request(input: input)
            .map { (data: ProfileResponse) -> [Movie] in
                data.cast + data.crew
            }
            .eraseToAnyPublisher()
    }
}
