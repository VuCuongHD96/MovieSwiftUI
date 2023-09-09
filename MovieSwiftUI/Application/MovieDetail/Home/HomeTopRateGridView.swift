//
//  HomeTopRateGridView.swift
//  MovieSwiftUI
//
//  Created by Work on 04/05/2023.
//

import SwiftUI

struct HomeTopRateGridView: View {
    
    private let gridRows = [
        GridItem(.fixed(238), spacing: 20),
        GridItem(.fixed(238), spacing: 0),
    ]
    let secondMovieArray: [Movie]
    @Binding var movieSelectedTrigger: Movie?
    
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridRows, spacing: 15) {
                    ForEach(secondMovieArray) { movie in
                        HomeTopRateView(movie: movie)
                            .onTapGesture {
                                movieSelectedTrigger = movie
                            }
                            .frame(width: 155)
                    }
                }
            }
        }
    }
}

struct HomeTopRateGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopRateGridView(secondMovieArray: [.defaultValue],
                            movieSelectedTrigger: .constant(.defaultValue))
        .previewLayout(.sizeThatFits)
    }
}
