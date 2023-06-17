//
//  PosterMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI
import Cosmos

struct PosterMovieDetailView: View {
    
    let url = URL(string: "https://image.tmdb.org/t/p/original/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg")!
    
    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            AsyncImage(url: url) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .cornerRadius(10)
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 188)
            VStack(alignment: .leading, spacing: 0) {
                Text("The Flash")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .font(.custom("Helvetica Neue", size: 20))
                    .padding(.bottom, 15)
                    .padding(.top, 36)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("3,292 People wathing")
                    .padding(.top, 15)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Helvetica Neue", size: 18))
                Text("Action, AdventureAction, AdventureAction, AdventureAction, AdventureAction, AdventureAction, Adventure,")
                    .font(.custom("Helvetica Neue", size: 18))
                    .padding(.top, 10)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .lineLimit(1)
                HStack {
                    Text("9.7")
                        .foregroundColor(Color("MovieDetailScore"))
                        .fontWeight(.medium)
                    MovieCosmosView(rating: 3)
                        .starSize(18)
                        .allowsHitTesting(false)
                }
                .padding(.top, 10)
            }
        }
        .frame(height: 188)
    }
}

struct PosterMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PosterMovieDetailView()
            .background(Color.purple)
    }
}

