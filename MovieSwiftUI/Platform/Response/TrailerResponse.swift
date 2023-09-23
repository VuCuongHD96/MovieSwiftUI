//
//  TrailerResponse.swift
//  MovieSwiftUI
//
//  Created by Work on 22/09/2023.
//

import Foundation

struct TrailerResponse: Codable {
    let id: Int
    let trailerList: [Trailer]
    
    enum CodingKeys: String, CodingKey {
        case id
        case trailerList = "results"
    }
}
