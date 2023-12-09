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
    
    @Binding var editing: Bool
    @Binding var removeAction: MovieItem?
    
    let movie: MovieItem

    var body: some View {
        HomeTopRateView(movie: movie)
            .overlay(alignment: .topLeading) {
                Image("IconDelete")
                    .resizable()
                    .frame(width: Constant.closeEdge, height: Constant.closeEdge)
                    .padding(.top, 10)
                    .offset(x: editing ? 10: -Constant.closeEdge)
                    .animation(.easeInOut, value: editing)
                    .onTapGesture {
                        removeAction = movie
                    }
                    .allowsHitTesting(editing)
            }
            .clipped()
            .frame(height: 260)
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(editing: .constant(true), 
                     removeAction: .constant(.defaultValue),
                     movie: .defaultValue)
            .frame(width: 234, height: 180)
    }
}
