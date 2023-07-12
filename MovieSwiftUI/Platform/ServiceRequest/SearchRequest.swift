//
//  SearchRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation

class SearchRequest: ServiceBaseRequest {

    required init(query: String) {
        let body: [String: Any] = [
            "language": "en-US",
            "query": query
        ]
        super.init(urlString: URLs.search, requestType: .get, body: body)
    }
}
