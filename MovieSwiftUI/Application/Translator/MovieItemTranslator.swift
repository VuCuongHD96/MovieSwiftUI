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
        return ReturnType(movieID: movie.id,
                          title: movie.title,
                          posterPathURL: movie.posterPathURL,
                          releaseYear: movie.releaseYear.toString(),
                          overview: movie.overview, 
                          score: ReturnType.Score(voteAverage: movie.voteAverage), 
                          releaseDate: movie.releaseDate,
                          backdropPathURL: movie.backdropPathURL,
                          genreNameArray: movie.genreNameArray)
    }
}
