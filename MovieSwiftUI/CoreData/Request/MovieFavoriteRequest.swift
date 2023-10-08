//
//  MovieFavoriteRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import CoreData

struct MovieFavoriteRequest: CoreDataBaseRequestType {
    
    typealias T = MovieFavorite
    var request: NSFetchRequest<T>
    
    init() {
        request = T.fetchRequest()
    }
}
