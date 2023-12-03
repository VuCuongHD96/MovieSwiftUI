//
//  FavoriteCell.swift
//  MovieSwiftUI
//
//  Created by Work on 31/07/2023.
//

import SwiftUI

struct FavoriteCell: View {
    
    struct Constant {
        static let closeEdge: CGFloat = 30
    }
    
    @EnvironmentObject private var input: FavoriteViewModel.Input
    let movie: MovieItem

    var body: some View {
        HomeTopRateView(movie: movie)
            .overlay(alignment: .topLeading) {
                Image("IconDelete")
                    .resizable()
                    .frame(width: Constant.closeEdge, height: Constant.closeEdge)
                    .padding(.top, 10)
                    .offset(x: input.editing ? 10: -Constant.closeEdge)
                    .animation(.easeInOut, value: input.editing)
                    .onTapGesture {
                        input.removeClickAction.send(movie)
                    }
                    .allowsHitTesting(input.editing)
            }
            .clipped()
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        let input = FavoriteViewModel.Input()
        FavoriteCell(movie: .defaultValue)
            .frame(width: 234, height: 180)
    }
}
