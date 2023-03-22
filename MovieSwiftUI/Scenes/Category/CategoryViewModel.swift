//
//  CategoryViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 12/03/2023.
//

import Combine
import Foundation

final class CategoryViewModel: ObservableObject {
    
    @Published private(set) var genreArray = [Genre]()
    @Published private(set) var alertMessage = AlertMessage()
    
    var anyCancellable = Set<AnyCancellable>()
    
    func bindViewModel() {
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker(false)
        GenreRepository(api: .share)
            .getGenreList()
            .trackActivity(activityTracker)
            .trackError(errorTracker)
            .asDriver()
            .assign(to: \.genreArray, on: self)
            .store(in: &anyCancellable)
        
        errorTracker
            .map {
                AlertMessage(error: $0)
            }
            .assign(to: \.alertMessage, on: self)
            .store(in: &anyCancellable)
    }
}
