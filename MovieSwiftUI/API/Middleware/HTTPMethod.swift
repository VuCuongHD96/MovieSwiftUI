//
//  HTTPMethod.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation

struct HTTPMethod {
    
    public let rawValue: String

    public init(rawValue: String) {
        self.rawValue = rawValue
    }
    
    static let get = HTTPMethod(rawValue: "get")
    static let post = HTTPMethod(rawValue: "post")
}
