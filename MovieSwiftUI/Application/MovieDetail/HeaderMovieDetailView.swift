//
//  HeaderMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct HeaderMovieDetailView: View {
    
    @State var clickButton = false
    @EnvironmentObject private var movieDetailInput: MovieDetailViewModel.Input
    
    var body: some View {
        HStack {
            Button {
                movieDetailInput.backButtonSubject.send()
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
                clickButton.toggle()
            } label: {
                Image(clickButton ? "FavoriteOrange" : "FavoriteWhite")
                    .resizable()
                    .frame(width: 35, height: 35)
                    .padding(8)
            }
        }
    }
}

struct HeaderMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
    let movieDetailInput = MovieDetailViewModel.Input()
        HeaderMovieDetailView()
            .previewLayout(.sizeThatFits)
            .environmentObject(movieDetailInput)
    }
}
