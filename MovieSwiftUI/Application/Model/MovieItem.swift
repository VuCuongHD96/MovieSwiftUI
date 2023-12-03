//
//  MovieItem.swift
//  MovieSwiftUI
//
//  Created by Work on 22/11/2023.
//

import Foundation

struct MovieItem {
    
    let movieID: Int32
    let title: String
    let posterPath: String?
    let releaseYear: String
    let overview: String
    let score: Score
    let releaseDate: String
    let backdropPath: String?
    var backdropPathURL: URL? {
        let backdropURL = URLs.imagesOriginalPath + (backdropPath ?? "")
        return URL(string: backdropURL)
    }
    var posterPathURL: URL? {
        let posterPathURL = URLs.imagesOriginalPath + (posterPath ?? "")
        return URL(string: posterPathURL)
    }
    let genreNameArray: String
    
    static var defaultValue: Self {
        return Self(
            movieID: 637,
            title: "Life Is Beautiful",
            posterPath: "/74hLDKjD5aGYOotO6esUVaeISa2.jpg",
            releaseYear: "1997",
            overview: "A touching story of an Italian book seller of Jewish ancestry who lives in his own little fairy tale. His creative and happy life would come to an abrupt halt when his entire family is deported to a concentration camp during World War II. While locked up he tries to convince his son that the whole thing is just a game.",
            score: Score(voteAverage: 5.6),
            releaseDate: "1997-12-20",
            backdropPath: "/gavyCu1UaTaTNPsVaGXT6pe5u24.jpg",
            genreNameArray: "Drama, Action"
        )
    }
}

extension MovieItem {
    
    struct Score: Equatable {
        
        var naturalPart = ""
        var decimalPart = ""
        var voteAverageRounded: Double = 0

        init(voteAverage: Double) {
            var voteAverageRounded = round(voteAverage * 10) / 10
            let voteAverageString = String(voteAverageRounded)
            let parts = voteAverageString.split(separator: ".")
            naturalPart = String(parts[0])
            decimalPart = String(parts[1])
            voteAverageRounded = round(voteAverage * 10) / 10
        }
    }
}
