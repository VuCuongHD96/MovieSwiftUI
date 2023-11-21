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
    var backdropPath: String?
    private let genreIDS: [Int]?
    var genreIDSUnwrapped: [Int] {
        return genreIDS ?? [Int]()
    }
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Double
    let posterPath: String?
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
    let genres: [Genre]?
    var backdropPathURL: URL? {
        let backdropURL = URLs.imagesOriginalPath + (backdropPath ?? "")
        return URL(string: backdropURL)
    }
    var posterPathURL: URL? {
        let posterPathURL = URLs.imagesOriginalPath + (posterPath ?? "")
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
        let voteAverageString = String(voteAverageRounded)
        let parts = voteAverageString.split(separator: ".")
        let naturalPart = String(parts[0])
        let decimalPart = String(parts[1])
        return (naturalPart, decimalPart)
    }
    var voteAverageRounded: Double {
        return round(voteAverage * 10) / 10
    }
    var genreNameArray: String {
        return genres?.compactMap {
            $0.name
        }.joined(separator: ", ") ?? ""
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
        case genres = "genres"
    }
}
