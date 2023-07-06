//
//  MovieByGenreView.swift
//  MovieSwiftUI
//
//  Created by Work on 03/05/2023.
//

import SwiftUI

struct MovieByGenreView: View {
    
    var body: some View {
        MovieNavigationView {
            MovieByGenreHeaderView()
        } bodyContent: {
            ScrollView {
                ForEach(1...10, id: \.self) { number in
                    MovieByGenreCell()
                }
            }
            .padding(.top, 20)
            .padding(.horizontal, 10)
        }
    }
}

struct MovieByGenreScreen_Previews: PreviewProvider {
    static var previews: some View {
        MovieByGenreView()
    }
}
