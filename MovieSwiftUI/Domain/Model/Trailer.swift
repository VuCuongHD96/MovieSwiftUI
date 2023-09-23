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
    var imageURL: URL? {
        return URL(string: "https://img.youtube.com/vi/\(key)/0.jpg")
    }
    
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

extension Trailer {
    
    static var defaultValue = Trailer(name: "Tom Holland Makes a Mean Negroni | Official Clip",
                                      key: "LgPj-TaHZWw",
                                      site: "YouTube",
                                      size: 1080,
                                      type: .clip,
                                      official: true,
                                      publishedAt: "2022-08-19T13:00:00.000Z",
                                      id: "62ffaab433a376007f86af0c")
}
