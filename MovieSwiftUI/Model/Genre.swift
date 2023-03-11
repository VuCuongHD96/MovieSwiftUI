//
//  Genre.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import Foundation

struct Genre {
    let id: Int
    let name: String
    
    static let firstItem = Genre(id: 0, name: "Action")
    static let secondItem = Genre(id: 1, name: "Adventure")
    static var array: [Genre] {
        return [firstItem, secondItem]
    }
}
