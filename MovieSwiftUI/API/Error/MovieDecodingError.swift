//
//  MovieDecodingError.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

struct MovieDecodingError {
    var debugDescription: String?

    init(error: Error) {
        guard let decodingError = error as? DecodingError else {
            return
        }
        switch decodingError {
        case .dataCorrupted(let context), .typeMismatch(_, let context), .valueNotFound(_, let context), .keyNotFound(_, let context):
            self.debugDescription = context.debugDescription
        @unknown default:
            break
        }
    }
}
