//
//  GenreRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation
import Combine

protocol GenreRepositoryType {
    func getGenreList() -> AnyPublisher<[Genre], Error>
}

class GenreRepository: ServiceBaseRepository, GenreRepositoryType {
    
    func getGenreList() -> AnyPublisher<[Genre], Error> {
        let input = GenreRequest()
        return api.request(input: input)
            .map { (data: GenreResponse) -> [Genre] in
                data.genres
            }
            .eraseToAnyPublisher()
    }
}
