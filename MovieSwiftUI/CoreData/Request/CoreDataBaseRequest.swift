//
//  CoreDataBaseRequest.swift
//  MovieSwiftUI
//
//  Created by Work on 26/09/2023.
//

import Foundation
import CoreData

protocol CoreDataBaseRequestType {
    associatedtype T: NSManagedObject
    var request: NSFetchRequest<T> { get }
}
