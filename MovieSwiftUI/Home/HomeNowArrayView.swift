//
//  HomeNowArrayView.swift
//  MovieSwiftUI
//
//  Created by Work on 25/02/2023.
//

import SwiftUI

struct HomeNowArrayView: View {
    
    @EnvironmentObject private var output: HomeViewModel.Output
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(output.firstMovieArray, id: \.self) { movie in
                    HomeNowView(movie: movie)
                }
            }
        }
    }
}

struct HomeNowArrayView_Previews: PreviewProvider {
    static var previews: some View {
        let output = HomeViewModel.Output()
        output.firstMovieArray = Array(repeating: Movie.defaultValue, count: 5)
        return HomeNowArrayView()
            .previewLayout(.sizeThatFits)
            .environmentObject(output)
            .previewLayout(.sizeThatFits)
    }
}
