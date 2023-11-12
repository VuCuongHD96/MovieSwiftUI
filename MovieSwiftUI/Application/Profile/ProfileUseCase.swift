//
//  ProfileUseCase.swift
//  MovieSwiftUI
//
//  Created by Work on 06/11/2023.
//

import Foundation

protocol ProfileUseCaseType {
    
    func getProfile(by id: Int) -> Observable<Profile>
    func getMovieList(by profileID: Int) -> Observable<[Movie]>
}

struct ProfileUseCase: ProfileUseCaseType {

    let profileRepository: ProfileRepositoryType = ProfileRepository(api: .share)
    let movieRepository: MovieRepositoryType = MovieRepository(api: .share)
    
    func getProfile(by id: Int) -> Observable<Profile> {
        profileRepository.getProfile(by: id)
    }
    
    func getMovieList(by profileID: Int) -> Observable<[Movie]> {
        movieRepository.getMovieList(by: profileID)
    }
}
