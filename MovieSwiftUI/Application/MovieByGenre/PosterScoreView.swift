//
//  PosterScoreView.swift
//  MovieSwiftUI
//
//  Created by Work on 02/07/2023.
//

import SwiftUI

struct PosterScoreView: View {
    
    let movie: MovieItem
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            AsyncImage(url: movie.posterPathURL) { image in
                image
                    .resizable()
                    .scaledToFit()
                    .cornerRadius(5)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 130)
            .frame(maxHeight: .infinity)
            ZStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
                Text(String(movie.score.voteAverageRounded))
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 5)
            .offset(x: 20)
        }
    }
}

struct PosterScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PosterScoreView(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
