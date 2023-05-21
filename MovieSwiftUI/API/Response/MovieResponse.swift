//
//  MovieResponse.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

struct MovieResponse: Codable {
    let dates: Dates?
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case dates, page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

