//
//  MovieByGenreHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 01/07/2023.
//

import SwiftUI

struct MovieByGenreHeaderView: View {
    
    @EnvironmentObject var input: MovieByGenreViewModel.Input
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                input.backAction.send()
            } label: {
                Image("back")
                    .padding(.leading, 8)
            }
            Spacer()
            Text("ACTION")
                .modifier(TitleModifier())
                .padding(8)
            Spacer()
            Image("SearchWhite")
                .padding(.trailing, 8)
                .onTapGesture {
                    input.searchAction.send()
                }
        }
    }
}

struct MovieByGenreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let input = MovieByGenreViewModel.Input()
        return MovieByGenreHeaderView()
            .background(Color.blue)
            .environmentObject(input)
    }
}
