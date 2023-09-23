//
//  TrailerRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 22/09/2023.
//

import Foundation
import Combine

protocol TrailerRepositoryType {
    func getTrailerList(movie: Movie) -> Observable<[Trailer]>
}

class TrailerRepository: ServiceBaseRepository, TrailerRepositoryType {
    
    func getTrailerList(movie: Movie) -> Observable<[Trailer]> {
        let input = TrailerRequest(movie: movie)
        return api.request(input: input)
            .map { (data: TrailerResponse) -> [Trailer] in
                data.trailerList
            }
            .eraseToAnyPublisher()
    }
}
