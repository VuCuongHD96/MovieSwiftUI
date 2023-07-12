//
//  AlertMessage.swift
//  MovieSwiftUI
//
//  Created by Work on 19/03/2023.
//

import Foundation

struct AlertMessage {
    public var title = ""
    public var message = ""
    public var isShowing = false
    
    public init() { }
    
    public init(title: String, message: String, isShowing: Bool) {
        self.title = title
        self.message = message
        self.isShowing = isShowing
    }
}

extension AlertMessage {
    init(error: Error) {
        let baseError = error as? BaseError
        self.title = baseError?.title ?? ""
        self.message = baseError?.errorMessage ?? ""
        self.isShowing = !message.isEmpty
    }
}
