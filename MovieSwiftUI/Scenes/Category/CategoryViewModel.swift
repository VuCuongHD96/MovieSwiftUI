//
//  CategoryViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Combine
import Foundation

struct CategoryViewModel: ViewModel {

    struct Input {
        var loadTrigger: Driver<Void>
    }
    
    class Output: ObservableObject {
        @Published var genreArray = [Genre]()
        @Published var alertMessage = AlertMessage()
        @Published var isLoading = false
    }
    
    let useCase: CategoryUseCaseType = CategoryUseCase()
    
     func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        let output = Output()
        input.loadTrigger
            .flatMap {
                self.useCase.getGenreList()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .assign(to: \.genreArray, on: output)
            .store(in: cancelBag)
        errorTracker
            .map {
                AlertMessage(error: $0)
            }
            .assign(to: \.alertMessage, on: output)
            .store(in: cancelBag)
         activityTracker
             .assign(to: \.isLoading, on: output)
             .store(in: cancelBag)
        
        return output
    }
}
