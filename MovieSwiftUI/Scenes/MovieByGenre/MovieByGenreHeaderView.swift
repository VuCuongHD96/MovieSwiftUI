//
//  MovieByGenreHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 01/07/2023.
//

import SwiftUI

struct MovieByGenreHeaderView: View {
    var body: some View {
        HStack(alignment: .center) {
            Button {
                // MARK: - Todo: back action
            } label: {
                Image("back")
                    .padding(.leading, 8)
            }
            Spacer()
            Text("ACTION")
                .fontWeight(.medium)
                .font(.custom("Helvetica Neue", size: 20))
                .foregroundColor(Color.white)
                .padding(8)
            Spacer()
            Image("SearchWhite")
                .padding(.trailing, 8)
        }    }
}

struct MovieByGenreHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieByGenreHeaderView()
            .background(Color.blue)
    }
}
