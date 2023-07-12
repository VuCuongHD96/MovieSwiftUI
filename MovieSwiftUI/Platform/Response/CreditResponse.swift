//
//  CreditResponse.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

class CreditResponse: Codable {
    
    var id = 0
    var castArray = [Cast]()
    var crewArray = [Crew]()
    var personArray: [Person] {
        return castArray + crewArray
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case castArray = "cast"
        case crewArray = "crew"
    }
}
