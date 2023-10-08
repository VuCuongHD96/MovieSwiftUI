//
//  MovieFavoriteRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Combine

class MovieFavoriteRepository: CoreDataBaseRepository {
    
    func getItemList() -> AnyPublisher<[MovieFavorite], Error> {
        let input = MovieFavoriteRequest()
        return coreDataManager.request(input: input)
    }
}
