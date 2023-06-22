//
//  BackGroundMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct BackGroundMovieDetailView: View {
    
    @EnvironmentObject private var movieDetailOutput: MovieDetailViewModel.Output
    
    var body: some View {
        ZStack {
            AsyncImage(url: movieDetailOutput.movie.backdropPathURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            Image("play")
                .onTapGesture {
                    print("----- debug ------  Image(play)")
                }
        }
    }
}

struct BackGroundMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetailOutput = MovieDetailViewModel.Output()
        movieDetailOutput.movie = .defaultValue
        return BackGroundMovieDetailView()
            .environmentObject(movieDetailOutput)
    }
}
