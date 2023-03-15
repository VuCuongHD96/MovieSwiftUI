//
//  APIService.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import Combine
import Foundation

struct APIService {
    
    static let share = APIService()
    private var session = URLSession.shared
    
    init() {
        let configuration = URLSessionConfiguration.default
        configuration.timeoutIntervalForRequest = 30
        configuration.timeoutIntervalForResource = 30
        session = URLSession(configuration: configuration)
    }
    
    func request<T: Decodable>(input: ServiceBaseRequest) -> Observable<T> {
        print("\n------------REQUEST INPUT")
        print("Link: %@", input.urlString)
        print("Body: %@", input.body)
        print("------------ END REQUEST INPUT\n")
        
        guard let url = input.url else {
            return Future<T, Error> { _ in
            }.eraseToAnyPublisher()
        }
        return session
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .map(\.data)
            .replaceError(with: Data())
            .decode(type: T.self, decoder: JSONDecoder())
            .catch{ _ in Empty() }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
