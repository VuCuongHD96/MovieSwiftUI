//
//  MovieItemTranslator.swift
//  MovieSwiftUI
//
//  Created by Work on 22/11/2023.
//

import Foundation

protocol BaseTranslator {
    associatedtype ReturnType
}

struct MovieItemTranslator: BaseTranslator {
    
    typealias ReturnType = MovieItem
    
    static func from(movie: Movie) -> ReturnType {
        return ReturnType(movieID: Int32(movie.id),
                          title: movie.title,
                          posterPath: movie.posterPath,
                          releaseYear: movie.releaseYear.toString(),
                          overview: movie.overview, 
                          score: ReturnType.Score(voteAverage: movie.voteAverage), 
                          releaseDate: movie.releaseDate,
                          backdropPath: movie.backdropPath,
                          genreNameArray: movie.genreNameArray)
    }
    
    static func from(movie: MovieFavorite) -> ReturnType {
        return ReturnType(movieID: Int32(movie.movieID),
                          title: movie.title ?? "",
                          posterPath: movie.posterPath ?? "",
                          releaseYear: movie.releaseYear ?? "",
                          overview: movie.overview ?? "",
                          score: MovieItem.Score(voteAverage: movie.voteAverage),
                          releaseDate: movie.releaseDate ?? "",
                          backdropPath: movie.backdropPath,
                          genreNameArray: movie.genreNameArray ?? "")
    }
}
