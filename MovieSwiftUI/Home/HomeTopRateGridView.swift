//
//  HomeTopRateGridView.swift
//  MovieSwiftUI
//
//  Created by Work on 04/05/2023.
//

import SwiftUI

struct HomeTopRateGridView: View {
    
    @EnvironmentObject private var output: HomeViewModel.Output
    @EnvironmentObject private var input: HomeViewModel.Input
    
    private let gridRows = [
        GridItem(.fixed(238), spacing: 20),
        GridItem(.fixed(238), spacing: 0),
    ]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridRows, spacing: 15) {
                    ForEach(output.secondMovieArray) { movie in
                        HomeTopRateView(movie: movie)
                            .onTapGesture {
                                input.movieAction.send(movie)
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
        let homeViewModelInput = HomeViewModel.Input()//(loadTrigger: .just(Void()))
        let homeViewModelOutput = HomeViewModel.Output()
        homeViewModelOutput.secondMovieArray = Array(repeating: Movie.defaultValue, count: 1)
        return HomeTopRateGridView()
            .previewLayout(.sizeThatFits)
            .environmentObject(homeViewModelInput)
            .environmentObject(homeViewModelOutput)
    }
}
