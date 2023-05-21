//
//  MovieType.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

struct MovieType {
    
    let value: String
    
    static let upcoming = MovieType(value: "upcoming")
    static let nowPlaying = MovieType(value: "now_playing")
    static let topRated = MovieType(value: "top_rated")
    static let popular = MovieType(value: "popular")
}
