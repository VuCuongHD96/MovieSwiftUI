//
//  ListCastMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct ListCastMovieDetailView: View {
    
    let row = [
        GridItem()
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 15) {
                ForEach(1...10, id: \.self) { item in
                    CastView()
                }
            }
        }
    }
}

struct ListCastMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListCastMovieDetailView()
            .previewLayout(.sizeThatFits)
    }
}
