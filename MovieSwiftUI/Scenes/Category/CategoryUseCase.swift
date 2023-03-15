//
//  CategoryUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 15/03/2023.
//

import Combine

struct CategoryUseCase {
    
    //    func getGenreList() -> Publishers.Map<AnyPublisher<GenreResponse, Error>, [Genre]> {
    //        GenreRepository(api: .share)
    //            .getGenreList()
    //    }
    
    func getGenreList() -> Observable<[Genre]> {
        GenreRepository(api: .share)
            .getGenreList()
    }
}
