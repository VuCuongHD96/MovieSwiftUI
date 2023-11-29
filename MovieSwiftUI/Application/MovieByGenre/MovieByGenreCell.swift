//
//  MovieByGenreCell.swift
//  MovieSwiftUI
//
//  Created by Work on 01/07/2023.
//

import SwiftUI

struct MovieByGenreCell: View {
    
    let movie: MovieItem
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                PosterScoreView(movie: movie)
                GeometryReader { proxy in
                    VStack {
                        Spacer()
                        MovieInforView(movie: movie)
                            .padding(.leading, 30)
                            .frame(height: proxy.size.height * 0.85)
                    }
                }
            }
            .frame(height: 200)
            Rectangle()
                .fill(.gray)
                .frame(height: 1)
                .padding(.horizontal, 10)
        }
    }
}

struct MovieByGenreCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieByGenreCell(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
