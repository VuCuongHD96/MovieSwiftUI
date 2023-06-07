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
}
