//
//  GenreUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 15/03/2023.
//

import Foundation

protocol CategoryUseCaseType {
    func getGenreList() -> Observable<[Genre]>
}

struct GenreUseCase: CategoryUseCaseType {
    
    func getGenreList() -> Observable<[Genre]> {
        GenreRepository(api: .share)
            .getGenreList()
    }
}
