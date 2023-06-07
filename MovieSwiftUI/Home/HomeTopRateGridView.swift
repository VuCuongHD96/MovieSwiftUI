//
//  HomeTopRateGridView.swift
//  MovieSwiftUI
//
//  Created by Work on 04/05/2023.
//

import SwiftUI

struct HomeTopRateGridView: View {
    
    @EnvironmentObject private var output: HomeViewModel.Output
    
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
                            .frame(width: 155, alignment: .bottom)
                    }
                }
            }
        }
    }
}

struct HomeTopRateGridView_Previews: PreviewProvider {
    static var previews: some View {
        let output = HomeViewModel.Output()
        output.secondMovieArray = Array(repeating: Movie.defaultValue, count: 1)
        return HomeTopRateGridView()
            .previewLayout(.sizeThatFits)
            .environmentObject(output)
    }
}
