//
//  HomeNowView.swift
//  MovieSwiftUI
//
//  Created by sun on 30/08/2022.
//

import SwiftUI

struct HomeNowView: View {
    
    let movie: Movie
    @EnvironmentObject private var input: HomeViewModel.Input
    
    var body: some View {
        VStack(spacing: 5) {
            MovieAsyncImage(url: movie.posterPathURL) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(5)
            } placeHolderContent: {
                ProgressView()
            }
            .frame(height: 200)
            Text(movie.title)
                .font(.subheadline)
                .font(Font.body.bold())
                .frame(height: 45, alignment: .top)
                .lineLimit(2)
        }
        .frame(width: 130)
        .onTapGesture {
            input.movieAction.send(movie)
        }
    }
}

struct HomeNowView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNowView(movie: .defaultValue)
    }
}
