//
//  CreditRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

class CreditRequest: ServiceBaseRequest {
    
    required init(movie: Movie) {
        let body: [String: Any] = [
            "language": "en-US"
        ]
        let url = URLs.credit + "\(movie.id)/credits"
        super.init(urlString: url, requestType: .get, body: body)
    }
}
