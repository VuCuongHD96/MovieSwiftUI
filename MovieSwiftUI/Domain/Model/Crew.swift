//
//  Crew.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

class Crew: Person {
    let department: Department = .acting
    let job: String = ""
    
    enum CodingKeys: String, CodingKey {
        case department, job
    }
}
