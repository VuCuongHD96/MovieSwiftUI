//
//  Person.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

class Person: Codable, Identifiable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment: Department
    let name, originalName: String
    let popularity: Double
    let profilePath: String?
    let creditID: String
    var profilePathURL: URL? {
        guard let profilePath = profilePath else { return nil }
        let profilePathURL = URLs.APIImagesOriginalPath + profilePath
        return URL(string: profilePathURL)
    }
    
    init(adult: Bool, gender: Int, id: Int, knownForDepartment: Department, name: String, originalName: String, popularity: Double, profilePath: String, creditID: String) {
        self.adult = adult
        self.gender = gender
        self.id = id
        self.knownForDepartment = knownForDepartment
        self.name = name
        self.originalName = originalName
        self.popularity = popularity
        self.profilePath = profilePath
        self.creditID = creditID
    }
    
    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case creditID = "credit_id"
    }
}

extension Person {
    
    static let defaultValue = Person(adult: true,
                                     gender: 2,
                                     id: 2,
                                     knownForDepartment: .acting,
                                     name: "Sun",
                                     originalName: "Sun",
                                     popularity: 10,
                                     profilePath: "/5UoZPWvGDKzUvJfRFavwOYM8Enz.jpg",
                                     creditID: "5dbdb8bfca835400145ef0b9")
}
