//
//  ListCastMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct ListCastMovieDetailView: View {
    
    @EnvironmentObject private var movieDetailOutput: MovieDetailViewModel.Output
    
    let row = [
        GridItem()
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 15) {
                ForEach(movieDetailOutput.personArray) { person in
                    CastView(person: person)
                }
            }
        }
    }
}

struct ListCastMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        let movieDetailOutput = MovieDetailViewModel.Output()
        movieDetailOutput.personArray = [.defaultValue]
        return ListCastMovieDetailView()
            .previewLayout(.sizeThatFits)
            .environmentObject(movieDetailOutput)
    }
}
