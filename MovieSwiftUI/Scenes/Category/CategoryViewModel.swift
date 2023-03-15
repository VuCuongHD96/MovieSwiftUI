//
//  CategoryViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Combine
import Foundation

struct CategoryViewModel {
    
    let useCase: CategoryUseCase
    
    //    @Published private(set) var genreArray = [Genre]()
    
    final class Input: ObservableObject {
        let loadTrigger: Driver<Void>
        
        init(loadTrigger: Driver<Void>) {
            self.loadTrigger = loadTrigger
        }
    }
    
    final class Output: ObservableObject {
        @Published var genreArray = [Genre]()
    }
    
    var anyCancellable = Set<AnyCancellable>()
    
    func bindViewModel() {
        //        GenreRepository(api: .share)
        //            .getGenreList()
        //            .catch{ _ in Empty() }
        //            .assign(to: \.genreArray, on: self)
        //            .store(in: &anyCancellable)
        
        let output = Output()

        let getGenreList = useCase.getGenreList()
            .asDriver()
       
        getGenreList
            .assign(to: &output.$genreArray)
    }
    
    mutating func transform(_ input: Input) { //} -> Output {
        let output = Output()
        let a = input.loadTrigger
            .handleEvents(receiveRequest:  { _ in
                useCase.getGenreList()
                    .asDriver()
                    .assign(to: \.genreArray, on: output)
                //                    .store(in: self.&anyCancellable)
            })
//            .map { _ in
//                useCase.getGenreList()
//                    .asDriver()
//            }

        a
        
//        a.sink { <#AnyPublisher<[Genre], Never>#> in
//            <#code#>
//        }
    }
}
