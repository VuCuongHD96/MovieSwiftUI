//
//  Genre.swift
//  MovieSwiftUI
//
//  Created by Work on 05/03/2023.
//

import Foundation

struct Genre: Codable, Equatable, Hashable {
    var id: Int
    var name: String
    var selected: Bool = false
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case selected
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id =  try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.selected = try container.decodeIfPresent(Bool.self, forKey: .selected) ?? false
    }
    
    init(id: Int, name: String) {
        self.id = id
        self.name = name
        self.selected = false
    }
}

extension Genre {
    static let action = Genre(id: 28, name: "Action")
    static let adventure = Genre(id: 12, name: "Adventure")
    static let animation = Genre(id: 16, name: "Animation")
    static let comedy = Genre(id: 35, name: "Comedy")
    static let crime = Genre(id: 80, name: "Crime")
    static var array: [Genre] {
        return [action, adventure, animation, comedy, crime]
    }
}
