//
//  MovieByGenreView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/05/2023.
//

import SwiftUI

struct MovieByGenreView: View {
    
    @ObservedObject var input: MovieByGenreViewModel.Input
    @ObservedObject var output: MovieByGenreViewModel.Output
    let cancelBag = CancelBag()
    
    init(viewModel: MovieByGenreViewModel) {
        let input = MovieByGenreViewModel.Input()
        output = viewModel.transform(input, cancelBag: cancelBag)
        self.input = input
    }
    
    var body: some View {
        MovieNavigationView {
            MovieByGenreHeaderView()
        } bodyContent: {
            ScrollView {
                ForEach(output.movieArray, id: \.self) { movie in
                    MovieByGenreCell(movie: movie)
                        .onTapGesture {
                            input.movieAction.send(movie)
                        }
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
        .onAppear {
            input.loadTrigger.send()
        }
        .environmentObject(input)
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
