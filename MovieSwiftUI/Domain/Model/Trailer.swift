//
//  Trailer.swift
//  MovieSwiftUI
//
//  Created by Work on 16/09/2023.
//

import Foundation

struct Trailer: Codable {
    
    let name, key: String
    let site: String
    let size: Int
    let type: TypeEnum
    let official: Bool
    let publishedAt, id: String
    
    enum CodingKeys: String, CodingKey {
        case name, key, site, size, type, official
        case publishedAt = "published_at"
        case id
    }
}

enum TypeEnum: String, Codable {
    case behindTheScenes = "Behind the Scenes"
    case clip = "Clip"
    case featurette = "Featurette"
    case teaser = "Teaser"
    case trailer = "Trailer"
}
