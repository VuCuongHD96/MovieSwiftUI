//
//  GenreRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Foundation
import Combine

protocol GenreRepositoryType {
    func getGenreList() -> Observable<[Genre]>
}

class GenreRepository: ServiceBaseRepository, GenreRepositoryType {
    
    func getGenreList() -> Observable<[Genre]> {
        let input = GenreRequest()
        return api.request(input: input)
            .map { (data: GenreResponse) -> [Genre] in
                data.genres
            }
            .eraseToAnyPublisher()
    }
}
