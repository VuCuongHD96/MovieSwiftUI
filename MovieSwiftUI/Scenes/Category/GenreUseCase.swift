//
//  GenreUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 15/03/2023.
//

import Foundation

protocol GenreUseCaseType {
    func getGenreList() -> Observable<[Genre]>
}

struct GenreUseCase: GenreUseCaseType {
    
    func getGenreList() -> Observable<[Genre]> {
        GenreRepository(api: .share)
            .getGenreList()
    }
}
