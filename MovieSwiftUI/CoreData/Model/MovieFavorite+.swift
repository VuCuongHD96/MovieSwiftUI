//
//  MovieFavorite+.swift
//  MovieSwiftUI
//
//  Created by Work on 07/10/2023.
//

import Foundation

extension MovieFavorite {
        
    convenience init(movieID: Int, title: String, backdropPath: String?) {
        self.init(context: CoreDataManager.shared.container.viewContext)
        self.movieID = Int16(movieID)
        self.title = title
        self.backdropPath = backdropPath
    }
}
