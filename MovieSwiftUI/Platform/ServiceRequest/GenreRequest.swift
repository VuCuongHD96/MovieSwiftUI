//
//  GenreRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation

class GenreRequest: ServiceBaseRequest {
    required init() {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        super.init(urlString: URLs.genre, requestType: .get, body: body)
    }
}
