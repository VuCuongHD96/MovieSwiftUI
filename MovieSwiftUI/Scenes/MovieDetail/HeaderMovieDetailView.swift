//
//  HeaderMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct HeaderMovieDetailView: View {
    
    @State var clickButton = false
    
    var body: some View {
        HStack {
            Button {
            } label: {
                Image("back")
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
            Spacer()
            Text("MOVIE DETAIL")
                .fontWeight(.medium)
                .font(.custom("Helvetica Neue", size: 25))
                .foregroundColor(Color.white)
                .padding(8)
            Spacer()
            Button {
                clickButton.toggle()
            } label: {
                Image(clickButton ? "FavoriteSelected" : "FavoriteWhite")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
        }
    }
}

struct HeaderMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderMovieDetailView()
            .previewLayout(.sizeThatFits)
    }
}
