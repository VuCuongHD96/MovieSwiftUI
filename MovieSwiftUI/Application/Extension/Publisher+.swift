//
//  Publisher+.swift
//  MovieSwiftUI
//
//  Created by Work on 09/09/2023.
//

import Combine

public protocol OptionalType {
    associatedtype Wrapped
    var value: Wrapped? { get }
}

extension Optional: OptionalType {
    public var value: Wrapped? {
        return self
    }
}

extension Publishers {
    struct Unwrapped<Upstream>: Publisher where Upstream: Publisher, Upstream.Output: OptionalType {
        public typealias Output = Upstream.Output.Wrapped
        public typealias Failure = Upstream.Failure
        
        public let upstream: Upstream
        
        public init(upstream: Upstream) {
            self.upstream = upstream
        }
        
        public func receive<S>(subscriber: S) where S: Subscriber, Failure == S.Failure, Output == S.Input {
            upstream
                .flatMap { optional -> AnyPublisher<Output, Failure> in
                    guard let unwrapped = optional.value else {
                        return Empty().eraseToAnyPublisher()
                    }
                    return Just(unwrapped).setFailureType(to: Failure.self).eraseToAnyPublisher()
                }
                .receive(subscriber: subscriber)
        }
    }
}

extension Publisher where Output: OptionalType {
    func unwrap() -> Publishers.Unwrapped<Self> {
        return Publishers.Unwrapped(upstream: self)
    }
}
