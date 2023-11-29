//
//  SearchResultView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/06/2023.
//

import SwiftUI

struct SearchResultView: View {
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    let movieArray: [MovieItem]
    @Binding var movieSelected: MovieItem?
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(movieArray, id: \.movieID) { movie in
                    HomeTopRateView(movie: movie)
                        .frame(width: 155, height: 238, alignment: .bottom)
                        .onTapGesture {
                            movieSelected = movie
                        }
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModelOutput = SearchViewModel.Output()
        searchViewModelOutput.movieArray = Array(repeating: MovieItem.defaultValue, count: 1)
        return SearchResultView(movieArray: [.defaultValue],
                                movieSelected: .constant(.defaultValue))
    }
}
