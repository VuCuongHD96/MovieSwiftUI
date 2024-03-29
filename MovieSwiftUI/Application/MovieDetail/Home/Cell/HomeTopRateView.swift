//
//  HomeTopRateView.swift
//  MovieSwiftUI
//
//  Created by sun on 31/08/2022.
//

import SwiftUI

struct HomeTopRateView: View {
    
    let movie: MovieItem
    
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
                    Text(movie.releaseYear)
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
    }
}

struct HomeTopRateView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopRateView(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
