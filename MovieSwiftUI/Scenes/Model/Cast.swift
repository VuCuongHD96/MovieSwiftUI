//
//  Cast.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

class Cast: Person {
    let castID: Int = 0
    let character: String = ""
    let order: Int = 0

    enum CodingKeys: String, CodingKey {
        case castID = "cast_id"
        case character
        case order
    }
}
