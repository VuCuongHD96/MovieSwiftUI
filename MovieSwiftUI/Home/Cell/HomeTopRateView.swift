//
//  HomeTopRateView.swift
//  MovieSwiftUI
//
//  Created by sun on 31/08/2022.
//

import SwiftUI

struct HomeTopRateView: View {
    
    let movie: Movie
    @EnvironmentObject private var input: HomeViewModel.Input
    
    var body: some View {
        ZStack {
            AsyncImage(url: movie.posterPathURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            VStack(alignment: .trailing) {
                ScoreView(movie: movie)
                    .padding(8)
                Spacer()
                VStack(alignment: .leading) {
                    Text(movie.releaseYear.toString())
                        .foregroundColor(Color.white)
                    Text(movie.title)
                        .foregroundColor(Color.white)
                        .bold()
                        .lineLimit(2)
                }
                .frame(maxWidth: .infinity, alignment: .bottomLeading)
                .padding([.leading, .bottom], 5)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .frame(width: 155, height: 238, alignment: .bottom)
        .onTapGesture {
            input.movieAction.send(movie)
        }
    }
}

struct HomeTopRateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopRateView(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
