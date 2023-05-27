//
//  HomeUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 21/05/2023.
//

import Foundation

protocol HomeUseCaseType {
    func getMovieList(page: Int, movieType: MovieType) -> Observable<[Movie]>
}

struct HomeUseCase: HomeUseCaseType {
    
    func getMovieList(page: Int, movieType: MovieType) -> Observable<[Movie]> {
        MovieRepository(api: .share)
            .getMovieList(page: page, movieType: movieType)
    }
}
