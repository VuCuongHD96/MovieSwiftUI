//
//  CoreDataBaseRepositoryType.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Combine

class CoreDataBaseRepository {
    
    var coreDataManager: CoreDataManager!
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func save() -> AnyPublisher<Bool, Error> {
        return coreDataManager.save()
    }
}
