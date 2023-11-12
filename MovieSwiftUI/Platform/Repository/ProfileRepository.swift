//
//  ProfileRepository.swift
//  MovieSwiftUI
//
//  Created by Work on 12/11/2023.
//

import Foundation

protocol ProfileRepositoryType {

    func getProfile(by id: Int) -> Observable<Profile>
}

class ProfileRepository: ServiceBaseRepository, ProfileRepositoryType {
    
    func getProfile(by id: Int) -> Observable<Profile> {
        let input = ProfileRequest(id: id)
        return api.request(input: input)
            .map { (data: Profile) in
                return data
            }
            .eraseToAnyPublisher()
    }
}
