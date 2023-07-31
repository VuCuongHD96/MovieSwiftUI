//
//  MovieFavorite+.swift
//  MovieSwiftUI
//
//  Created by Work on 07/10/2023.
//

import Foundation

extension MovieFavorite {
        
    convenience init(movieID: Int32,
                     title: String,
                     backdropPath: String?,
                     genreNameArray: String?,
                     overview: String?,
                     posterPath: String?, 
                     releaseDate: String?,
                     releaseYear: String?,
                     voteAverage: Double) {
        self.init(context: CoreDataManager.shared.container.viewContext)
        self.movieID = movieID
        self.title = title
        self.backdropPath = backdropPath
        self.genreNameArray = genreNameArray
        self.overview = overview
        self.posterPath = posterPath
        self.releaseDate = releaseDate
        self.releaseYear = releaseYear
        self.voteAverage = voteAverage
    }
}
