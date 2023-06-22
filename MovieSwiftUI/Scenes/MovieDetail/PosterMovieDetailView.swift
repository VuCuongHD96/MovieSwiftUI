//
//  PosterMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI
import Cosmos

struct PosterMovieDetailView: View {
    
    @EnvironmentObject private var movieDetailOutput: MovieDetailViewModel.Output
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: movieDetailOutput.movie.posterPathURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 188)
            VStack(alignment: .leading, spacing: 0) {
                VStack {
                    Spacer()
                    Text(movieDetailOutput.movie.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.custom("Helvetica Neue", size: 20))
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 60)
                        .padding(.bottom, 15)
                }
                Text(movieDetailOutput.movie.releaseDate)
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Helvetica Neue", size: 18))
                Text(movieDetailOutput.movie.genreNameArray)
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                HStack {
                    Text(String(movieDetailOutput.movie.voteAverageRounded))
                        .foregroundColor(Color("MovieDetailScore"))
                        .fontWeight(.medium)
                    MovieCosmosView(rating: movieDetailOutput.movie.voteAverage)
                        .starSize(18)
                        .allowsHitTesting(false)
                }
                .padding(.top, 10)
                Spacer()
            }
        }
        .frame(height: 188)
    }
}

struct PosterMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetailOutput = MovieDetailViewModel.Output()
        movieDetailOutput.movie = .defaultValue
        return PosterMovieDetailView()
            .background(Color.purple)
            .environmentObject(movieDetailOutput)
            .previewLayout(.sizeThatFits)
    }
}

