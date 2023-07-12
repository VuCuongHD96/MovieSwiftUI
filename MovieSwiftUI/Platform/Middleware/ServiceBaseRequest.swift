//
//  ServiceBaseRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation

class ServiceBaseRequest {
    
    private(set) var urlString = ""
    private(set) var requestType = HTTPMethod.get
    private(set) var body: [String: Any] = [:]
    var url: URL? {
        guard let url = URL(string: urlString) else {
            return nil
        }
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)
        components?.queryItems = body.map {
            URLQueryItem(name: $0, value: "\($1)" )
        }
        return components?.url
    }
    
    init(urlString: String) {
        self.urlString = urlString
    }
    
    init(urlString: String, requestType: HTTPMethod) {
        self.urlString = urlString
        self.requestType = requestType
    }
    
    init(urlString: String, requestType: HTTPMethod, body: [String: Any]?) {
        self.urlString = urlString
        self.requestType = requestType
        var body = body ?? [:]
        body["api_key"] = API.key
        self.body = body
    }
}
