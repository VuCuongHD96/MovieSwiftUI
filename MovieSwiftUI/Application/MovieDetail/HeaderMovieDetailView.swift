//
//  HeaderMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct HeaderMovieDetailView: View {
    
    @Binding var favoriteAction: Bool
    var isFavorite = false
    @Binding var backTrigger: Void?
    
    var body: some View {
        HStack {
            Button {
                backTrigger = Void()
            } label: {
                Image("back")
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
            Spacer()
            Text("MOVIE DETAIL")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            Button {
                favoriteAction = !isFavorite
            } label: {
                Image(isFavorite ? "FavoriteOrange" : "FavoriteWhite")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
        }
    }
}

struct HeaderMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMovieDetailView(favoriteAction: .constant(true), isFavorite: true, backTrigger: .constant(Void()))
            .previewLayout(.sizeThatFits)
    }
}
