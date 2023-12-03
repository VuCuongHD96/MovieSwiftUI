//
//  MovieFavoriteRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import CoreData

protocol MovieFavoriteRequestType {
    
    func findMovie(with movieID: Int32)
}

struct MovieFavoriteRequest: CoreDataBaseRequestType, MovieFavoriteRequestType {
    typealias T = MovieFavorite
    var request: NSFetchRequest<T>
    
    init() {
        request = T.fetchRequest()
    }
    
    func findMovie(with movieID: Int32) {
        let predicate = NSPredicate(format: "movieID == %@", "\(movieID)")
        request.predicate = predicate
    }
}
