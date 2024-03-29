//
//  HomeNowArrayView.swift
//  MovieSwiftUI
//
//  Created by Work on 25/02/2023.
//

import SwiftUI

struct HomeNowArrayView: View {
    
    let firstMovieArray: [MovieItem]
    @Binding var movieSelectedTrigger: MovieItem?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(firstMovieArray, id: \.movieID) { movie in
                    HomeNowView(movie: movie)
                        .onTapGesture {
                            movieSelectedTrigger = movie
                        }
                }
            }
        }
    }
}

struct HomeNowArrayView_Previews: PreviewProvider {
    static var previews: some View {
        let output = HomeViewModel.Output()
        output.firstMovieArray = Array(repeating: MovieItem.defaultValue, count: 5)
        return HomeNowArrayView(firstMovieArray: [.defaultValue],
                                movieSelectedTrigger: .constant(.defaultValue))
            .previewLayout(.sizeThatFits)
    }
}
