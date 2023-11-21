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
    
    @Binding var click: Bool

    var body: some View {
        HomeTopRateView(movie: MovieItem.defaultValue)
            .overlay(alignment: .topLeading) {
                Image("IconDelete")
                    .resizable()
                    .frame(width: Constant.closeEdge, height: Constant.closeEdge)
                    .padding(.top, 10)
                    .offset(x: click ? 5: -Constant.closeEdge, y: 5)
                    .animation(.easeInOut, value: click)
            }
            .onTapGesture {
                click.toggle()
            }
            .clipped()
    }
}

struct FavoriteCell_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteCell(click: .constant(false))
            .frame(width: 234, height: 180)
    }
}
