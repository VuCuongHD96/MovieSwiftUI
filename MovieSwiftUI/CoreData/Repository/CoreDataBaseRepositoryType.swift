//
//  CoreDataBaseRepositoryType.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Combine
import CoreData

class CoreDataBaseRepository {
    
    var coreDataManager: CoreDataManager!
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func save() -> Observable<Bool> {
        return coreDataManager.save()
    }
    
    func delete(object: NSManagedObject) {
        coreDataManager.delete(object: object)
    }
}
