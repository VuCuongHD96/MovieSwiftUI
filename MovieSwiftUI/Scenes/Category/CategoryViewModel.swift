//
//  CategoryViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Combine
import Foundation

final class CategoryViewModel: ObservableObject {
      
    @Published private(set) var genreArray = [Genre]()
        
    var anyCancellable = Set<AnyCancellable>()
    
    func bindViewModel() {
        GenreRepository(api: .share)
            .getGenreList()
            .catch{ _ in Empty() }
            .assign(to: \.genreArray, on: self)
            .store(in: &anyCancellable)
    }
}
