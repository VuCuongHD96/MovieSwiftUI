//
//  Genre.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import Foundation

struct Genre: Codable, Identifiable, Hashable {
    var id: Int
    var name: String
    
    static let firstItem = Genre(id: 0, name: "Action")
    static let secondItem = Genre(id: 1, name: "Adventure")
    static var array: [Genre] {
        return [firstItem, secondItem]
    }
}
