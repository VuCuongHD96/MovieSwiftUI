//
//  MovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 24/05/2023.
//

import SwiftUI

struct MovieDetailView: View {
    
    private var movieDetailInput: MovieDetailViewModel.Input
    @ObservedObject private var movieDetailOutput: MovieDetailViewModel.Output
    var cancelBag = CancelBag()
    
    init(viewModel: MovieDetailViewModel) {
        let movieDetailInput = MovieDetailViewModel.Input()
        movieDetailOutput = viewModel.transform(movieDetailInput, cancelBag: cancelBag)
        self.movieDetailInput = movieDetailInput
    }
    
    var body: some View {
        MovieNavigationView {
            HeaderMovieDetailView()
        } bodyContent: {
            ScrollView {
                VStack(spacing: 0) {
                    ZStack(alignment: .top) {
                        BackGroundMovieDetailView()
                            .frame(width: Screen.width, height: 280)
                        PosterMovieDetailView()
                            .padding(.top, 205)
                            .padding([.leading, .trailing], 20)
                    }
                   Text("Full Cast & Crew")
                    MovieExpandText(
                        message: movieDetailOutput.movie.overview,
                        moreText: {
                            Text("More")
                                .fontWeight(.medium)
                                .background(Color.white)
                                .foregroundColor(.red)
                                .allowsHitTesting(false)
                        }, lessText: {
                            Text("Less")
                                .fontWeight(.medium)
                                .background(Color.white)
                                .foregroundColor(.gray)
                                .allowsHitTesting(false)
                        })
                    .lineLimit(3)
                    .padding(20)
                    Text("Full Cast & Crew")
                        .padding(.vertical)
                        .padding(.leading, 20)
                        .font(.subheadline)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .background(Color.gray.opacity(0.2))
                    ListCastMovieDetailView()
                        .padding(10)
                }
                Spacer()
            }
        }
        .frame(maxWidth: .infinity)
        .onAppear {
            movieDetailInput.loadTrigger.send()
        }
        .environmentObject(movieDetailOutput)
        .alert(isPresented: $movieDetailOutput.alert.isShowing) {
            Alert(title: Text(movieDetailOutput.alert.title),
                  message: Text(movieDetailOutput.alert.message),
                  dismissButton: .default(Text("OK"))
            )
        }
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let navigationController = UINavigationController()
        let navigator = MovieDetailNavigator(navigationController: navigationController)
        let useCase = MovieDetailUseCase()
        let viewModel = MovieDetailViewModel(navigator: navigator, useCase: useCase, movie: .defaultValue)
        return MovieDetailView(viewModel: viewModel)
    }
}
