//
//  ServiceBaseRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation

class ServiceBaseRepository {
    
    var api: APIService!

    init(api: APIService) {
        self.api = api
    }
}
