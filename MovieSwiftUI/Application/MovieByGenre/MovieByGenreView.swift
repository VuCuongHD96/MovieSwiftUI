//
//  MovieByGenreView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/05/2023.
//

import SwiftUI

struct MovieByGenreView: View {
    
    @ObservedObject private var movieByGenreViewModelInput: MovieByGenreViewModel.Input
    @ObservedObject private var movieByGenreViewModelOutput: MovieByGenreViewModel.Output
    private let cancelBag = CancelBag()
    
    init(viewModel: MovieByGenreViewModel) {
        let movieByGenreViewModelInput = MovieByGenreViewModel.Input()
        movieByGenreViewModelOutput = viewModel.transform(movieByGenreViewModelInput,
                                                          cancelBag: cancelBag)
        self.movieByGenreViewModelInput = movieByGenreViewModelInput
    }
    
    var body: some View {
        MovieNavigationView {
            MovieByGenreHeaderView(backAction: $movieByGenreViewModelInput.backAction,
                                   searchAction: $movieByGenreViewModelInput.searchAction)
        } bodyContent: {
            ScrollView {
                ForEach(movieByGenreViewModelOutput.movieArray, id: \.movieID) { movie in
                    MovieByGenreCell(movie: movie)
                        .onTapGesture {
                            movieByGenreViewModelInput.movieAction.send(movie)
                        }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
        .alert(isPresented: $movieByGenreViewModelOutput.alertMessage.isShowing) {
            let goBackButton = Alert.Button.default(Text("Go back!")) {
                movieByGenreViewModelInput.backAction = Void()
            }
            return Alert(
                title: Text(movieByGenreViewModelOutput.alertMessage.title),
                message: Text(movieByGenreViewModelOutput.alertMessage.message),
                dismissButton: goBackButton
            )
        }
    }
}

struct MovieByGenreScreen_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = MovieByGenreNavigator(navigationController: navigationController)
        let useCase = MovieByGenreUseCase()
        let viewModel = MovieByGenreViewModel(navigator: navigator, useCase: useCase, genre: .action)
        return MovieByGenreView(viewModel: viewModel)
    }
}
