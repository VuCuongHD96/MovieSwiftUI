//
//  MovieByGenreHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 01/07/2023.
//

import SwiftUI

struct MovieByGenreHeaderView: View {
    
    @Binding var backAction: Void?
    @Binding var searchAction: Void?
    
    var body: some View {
        HStack(alignment: .center) {
            Button {
                backAction = Void()
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
                    searchAction = Void()
                }
        }
    }
}

struct MovieByGenreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        return MovieByGenreHeaderView(backAction: .constant(Void()),
                                      searchAction: .constant(Void()))
        .background(Color.blue)
    }
}
