//
//  MovieFavoriteRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Combine

protocol MovieFavoriteRepositoryType: CoreDataBaseRepository {
    
    func getItemList() -> Observable<[MovieFavorite]>
    func isMovieSaved(with movieID: Int32) -> Observable<Bool>
    func findMovie(with movieID: Int32) -> Observable<[MovieFavorite]>
}

class MovieFavoriteRepository: CoreDataBaseRepository, MovieFavoriteRepositoryType {
    
    func getItemList() -> Observable<[MovieFavorite]> {
        let input = MovieFavoriteRequest()
        return coreDataManager.request(input: input)
    }
    
    func findMovie(with movieID: Int32) -> Observable<[MovieFavorite]> {
        let input = MovieFavoriteRequest()
        input.findMovie(with: movieID)
        return coreDataManager.request(input: input)
    }
    
    func isMovieSaved(with movieID: Int32) -> Observable<Bool> {
        return findMovie(with: movieID)
            .map {
                !$0.isEmpty
            }
            .eraseToAnyPublisher()
    }
}
