//
//  CreditRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 24/06/2023.
//

import Foundation

protocol CreditRepositoryType {
    func getCredit(movie: Movie) -> Observable<[Person]>
}

final class CreditRepository: ServiceBaseRepository, CreditRepositoryType {
    
    func getCredit(movie: Movie) -> Observable<[Person]> {
        let input = CreditRequest(movie: movie)
        return api.request(input: input)
            .map { (data: CreditResponse) -> [Person] in
                return data.personArray
            }
            .eraseToAnyPublisher()
    }
}
