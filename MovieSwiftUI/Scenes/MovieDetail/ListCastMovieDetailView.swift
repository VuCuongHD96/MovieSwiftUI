//
//  ListCastMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct ListCastMovieDetailView: View {
    
    var personArray: [Person] = [.defaultValue]
    
    let row = [
        GridItem()
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 15) {
                ForEach(personArray) { person in
                    CastView(person: person)
                }
            }
        }
    }
}

struct ListCastMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        return ListCastMovieDetailView()
            .previewLayout(.sizeThatFits)
    }
}
