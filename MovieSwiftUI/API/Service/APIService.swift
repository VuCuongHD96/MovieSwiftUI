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
        guard let url = input.url else {
            return Fail(error: BaseError.redirectionError).eraseToAnyPublisher()
        }
        
        return session
            .dataTaskPublisher(for: url)
            .subscribe(on: DispatchQueue.global())
            .tryMap { data, response in
                print("\n------------REQUEST INPUT")
                print("Link: %@", input.urlString)
                print("Body: %@", input.body)
                print("------------ END REQUEST INPUT\n")
                guard let statusCode = (response as? HTTPURLResponse)?.statusCode else {
                    throw BaseError.redirectionError
                }
                if statusCode == 200 {
                    print("\n------------RESPONSE OUTPUT")
                    DictionaryPrinter.printBeauty(data: data)
                    print("------------END RESPONSE OUTPUT")
                    return data
                } else {
                    throw BaseError.httpError(httpCode: statusCode)
                }
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                return BaseError.errorParsing
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
