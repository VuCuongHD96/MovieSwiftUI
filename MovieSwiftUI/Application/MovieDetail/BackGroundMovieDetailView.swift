//
//  BackGroundMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct BackGroundMovieDetailView: View {
    
    let movie: Movie
    @Binding var playTrigger: Movie?
    
    var body: some View {
        ZStack {
            AsyncImage(url: movie.backdropPathURL) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            Image("play")
                .onTapGesture {
                    playTrigger = movie
                }
        }
    }
}

struct BackGroundMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BackGroundMovieDetailView(movie: .defaultValue, playTrigger: .constant(.defaultValue))
    }
}
