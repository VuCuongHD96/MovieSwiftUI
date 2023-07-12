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
    
    @EnvironmentObject private var searchViewModelInput: SearchViewModel.Input
    @EnvironmentObject private var searchViewModelOutput: SearchViewModel.Output
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(searchViewModelOutput.filterMovieArray, id: \.id) { movie in
                    HomeTopRateView(movie: movie)
                        .frame(width: 155, height: 238, alignment: .bottom)
                        .onTapGesture {
                            searchViewModelInput.movieAction.send(movie)
                        }
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModelInput = SearchViewModel.Input()
        let searchViewModelOutput = SearchViewModel.Output()
        searchViewModelOutput.filterMovieArray = Array(repeating: Movie.defaultValue, count: 1)
        return SearchResultView()
            .environmentObject(searchViewModelInput)
            .environmentObject(searchViewModelOutput)
    }
}
