//
//  TrailerRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 22/09/2023.
//

import Foundation

class TrailerRequest: ServiceBaseRequest {
    
    required init(movie: MovieItem) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.trailer + "\(movie.movieID)/videos"
        super.init(urlString: url, requestType: .get, body: body)
    }
}
