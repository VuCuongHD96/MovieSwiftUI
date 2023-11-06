//
//  ProfileResponse.swift
//  MovieSwiftUI
//
//  Created by Work on 12/11/2023.
//

import Foundation

struct ProfileResponse: Codable {
    let cast, crew: [Movie]
    let id: Int
}
