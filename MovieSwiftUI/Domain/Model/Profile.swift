//
//  Profile.swift
//  MovieSwiftUI
//
//  Created by Work on 12/11/2023.
//

import Foundation

struct Profile: Codable {
    let adult: Bool
    let alsoKnownAs: [String]
    let biography, birthday: String
    let gender: Int
    let id: Int
    let imdbID, knownForDepartment, name, placeOfBirth: String
    let popularity: Double
    let profilePath: String
    var profilePathURL: URL? {
        let profilePathURL = URLs.imagesOriginalPath + profilePath
        return URL(string: profilePathURL)
    }

    enum CodingKeys: String, CodingKey {
        case adult
        case alsoKnownAs = "also_known_as"
        case biography, birthday, gender, id
        case imdbID = "imdb_id"
        case knownForDepartment = "known_for_department"
        case name
        case placeOfBirth = "place_of_birth"
        case popularity
        case profilePath = "profile_path"
    }
    
    init() {
        self.adult = false
        self.alsoKnownAs = []
        self.biography = ""
        self.birthday = ""
        self.gender = 0
        self.id = 0
        self.imdbID = ""
        self.knownForDepartment = ""
        self.name = ""
        self.placeOfBirth = ""
        self.popularity = 0
        self.profilePath = ""
    }
}
