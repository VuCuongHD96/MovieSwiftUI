//
//  CoreDataManager.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Combine
import CoreData

struct CoreDataManager {
    
    static let shared = CoreDataManager()
    
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "DataBase")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    func request<R: CoreDataBaseRequestType>(input: R) -> Observable<[R.T]> {
        return Future { promise in
            do {
                let results = try container.viewContext.fetch(input.request)
                promise(.success(results))
            } catch(let error) {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save() -> Observable<Bool> {
        return Future { promise in
            do {
                try container.viewContext.save()
                promise(.success(true))
            } catch(let error) {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func delete(object: NSManagedObject) {
        container.viewContext.delete(object)
    }
}
