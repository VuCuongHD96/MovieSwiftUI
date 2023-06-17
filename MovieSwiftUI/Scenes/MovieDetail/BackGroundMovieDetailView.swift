//
//  BackGroundMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct BackGroundMovieDetailView: View {
    
    let url = URL(string: "https://image.tmdb.org/t/p/original/nGxUxi3PfXDRm7Vg95VBNgNM8yc.jpg")!
    
    var body: some View {
        ZStack {
            AsyncImage(url: url) { image in
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
        BackGroundMovieDetailView()
    }
}
