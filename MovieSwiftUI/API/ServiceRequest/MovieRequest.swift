//
//  MovieRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

class MovieRequest: ServiceBaseRequest {
    
    required init(page: Int, movieType: MovieType) {
        let body: [String: Any] = [
            "language": "en-US",
            "page": page
        ]
        super.init(urlString: URLs.movie + movieType.value, requestType: .get, body: body)
    }
    
    required init(movieID: Int) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.movie + String(movieID)
        super.init(urlString: url, requestType: .get, body: body)
    }
}
