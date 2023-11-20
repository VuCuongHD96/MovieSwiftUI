//
//  TrailerViewModel.swift
//  MovieSwiftUI
//
//  Created by Work on 22/09/2023.
//

import Combine
import YouTubeKit

struct TrailerViewModel {
    
    struct Input {
        var loadTrigger = PassthroughSubject<Void, Never>()
        var dismissAction = PassthroughSubject<Void, Never>()
        var openTrailerAction = PassthroughSubject<Trailer, Never>()
    }
    
    class Output: ObservableObject {
        @Published var trailerList = [Trailer]()
        @Published var trailer: Trailer?
        @Published var alertMessage = AlertMessage()
    }
    
    let trailerUseCase: TrailerUseCaseType
    let trailerNavigator: TrailerNavigator
    let movie: Movie
}

extension TrailerViewModel: ViewModel {
    
    func transform(_ input: Input, cancelBag: CancelBag) -> Output {
        let output = Output()
        let errorTracker = ErrorTracker()
        
        input.loadTrigger
            .flatMap { _ in
                trailerUseCase.getTrailerList(movie: movie)
                    .asDriver()
            }
            .assign(to: \.trailerList, on: output)
            .store(in: cancelBag)
        
        input.dismissAction
            .sink { _ in
                trailerNavigator.dismiss()
            }
            .store(in: cancelBag)

        input.openTrailerAction
            .flatMap { trailer in
                YoutubeDownloader.shared
                    .fetchYouTubeStream(videoID: trailer.key)
                    .trackError(errorTracker)
                    .asDriver()
            }
            .sink { stream in
                trailerNavigator.toVideoScreen(stream: stream)
            }
            .store(in: cancelBag)
        
        errorTracker
            .map {
                AlertMessage(error: $0)
            }
            .assign(to: \.alertMessage, on: output)
            .store(in: cancelBag)
        
        return output
    }
}
