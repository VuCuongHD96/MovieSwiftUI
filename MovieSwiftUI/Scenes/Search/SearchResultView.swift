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
    
    @EnvironmentObject private var output: SearchViewModel.Output
    @EnvironmentObject private var input: HomeViewModel.Input
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(output.movieArray, id: \.id) { movie in
                    HomeTopRateView(movie: movie)
                        .frame(width: 155, height: 238, alignment: .bottom)
                        .onTapGesture {
                            input.movieAction.send(movie)
                        }
                }
            }
        }
    }
}

struct SearchResultView_Previews: PreviewProvider {
    static var previews: some View {
        let homeViewModelInput = HomeViewModel.Input()
        let searchViewModelOutput = SearchViewModel.Output()
        searchViewModelOutput.movieArray = Array(repeating: Movie.defaultValue, count: 1)
        return SearchResultView()
            .environmentObject(homeViewModelInput)
            .environmentObject(searchViewModelOutput)
    }
}
