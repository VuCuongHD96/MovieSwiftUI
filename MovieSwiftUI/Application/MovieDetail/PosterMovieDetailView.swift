//
//  PosterMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI
import Cosmos

struct PosterMovieDetailView: View {
    
    let movie: MovieItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: movie.posterPathURL) { image in
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
                    Text(movie.title)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.custom("Helvetica Neue", size: 20))
                        .lineLimit(2)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .frame(height: 60)
                        .padding(.bottom, 15)
                }
                Text(movie.releaseDate)
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Helvetica Neue", size: 18))
                Text(movie.genreNameArray)
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                HStack {
                    Text(String(movie.score.voteAverageRounded))
                        .foregroundColor(Color("MovieDetailScore"))
                        .fontWeight(.medium)
                    MovieCosmosView(rating: movie.score.voteAverageRounded)
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
        PosterMovieDetailView(movie: .defaultValue)
            .background(Color.purple)
            .previewLayout(.sizeThatFits)
    }
}

