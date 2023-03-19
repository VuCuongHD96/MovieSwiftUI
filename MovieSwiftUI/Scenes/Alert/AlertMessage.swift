//
//  AlertMessage.swift
//  MovieSwiftUI
//
//  Created by Work on 19/03/2023.
//

import Foundation

public struct AlertMessage {
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

public extension AlertMessage {
    init(error: Error) {
        self.title = "Error"
        let message = error.localizedDescription
        self.message = message
        self.isShowing = !message.isEmpty
    }
}
