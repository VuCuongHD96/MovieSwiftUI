//
//  HeaderMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct HeaderMovieDetailView: View {
    
    @State private var favorite = false
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
                favorite.toggle()
            } label: {
                Image(favorite ? "FavoriteOrange" : "FavoriteWhite")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
        }
    }
}

struct HeaderMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMovieDetailView(backTrigger: .constant(Void()))
            .previewLayout(.sizeThatFits)
    }
}
