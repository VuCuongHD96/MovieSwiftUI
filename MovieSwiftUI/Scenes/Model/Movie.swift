//
//  Movie.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    let id: Int
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    var backdropPathURL: URL? {
        let backdropURL = URLs.APIImagesOriginalPath + backdropPath
        return URL(string: backdropURL)
    }
    var posterPathURL: URL? {
        let posterPathURL = URLs.APIImagesOriginalPath + posterPath
        return URL(string: posterPathURL)
    }
    var releaseYear: Int {
        let dateTransformer = DateTransformer()
        if let year = dateTransformer.stringToInt(dateString: releaseDate, dateFormatType: .yearMonthDay, component: .year) {
            return year
        } else {
            return 0
        }
    }
    var voteAverageSplit: (naturalPart: String, decimalPart: String) {
        let voteAverageString = String(voteAverage)
        let parts = voteAverageString.split(separator: ".")
        let naturalPart = String(parts[0])
        let decimalPart = String(parts[1])
        return(naturalPart, decimalPart)
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    static let defaultValue = Movie(id: 1,
                                    adult: true,
                                    backdropPath: "/c3hl9E8E7b9opXDFVF5tSyk0ykr.jpg",
                                    genreIDS: [],
                                    originalLanguage: "",
                                    originalTitle: "",
                                    overview: "",
                                    popularity: 0,
                                    posterPath: "",
                                    releaseDate: "2023-04-05",
                                    title: "This is titleThis is titleThis is titleThis is title",
                                    video: true,
                                    voteAverage: 1.0,
                                    voteCount: 0)
}
