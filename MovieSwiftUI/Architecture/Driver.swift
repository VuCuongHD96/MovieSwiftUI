//
//  Driver.swift
//  MovieSwiftUI
//
//  Created by Work on 15/03/2023.
//

import Combine
import Foundation

public typealias Driver<T> = AnyPublisher<T, Never>

extension Publisher {
    public func asDriver() -> Driver<Output> {
        return self.catch { _ in Empty() }
            .receive(on: RunLoop.main)
            .eraseToAnyPublisher()
    }
    
    public static func just(_ output: Output) -> Driver<Output> {
        return Just(output).eraseToAnyPublisher()
    }
}
