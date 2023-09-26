//
//  MovieFavorite+.swift
//  MovieSwiftUI
//
//  Created by Work on 07/10/2023.
//

import Foundation

extension MovieFavorite {
        
    convenience init(movieID: Int16) {
        self.init(context: CoreDataManager.shared.container.viewContext)
        self.movieID = movieID
    }
}
