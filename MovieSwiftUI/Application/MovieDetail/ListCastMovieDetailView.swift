//
//  ListCastMovieDetailView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct ListCastMovieDetailView: View {
    
    let personArray: [Person]
    @Binding var selectedPerson: Person?
    
    let row = [
        GridItem()
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: row, spacing: 15) {
                ForEach(personArray, id: \.creditID) { person in
                    CastView(person: person)
                        .onTapGesture {
                            selectedPerson = person
                        }
                }
            }
        }
    }
}

struct ListCastMovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListCastMovieDetailView(personArray: [.defaultValue], selectedPerson: .constant(.defaultValue))
            .previewLayout(.sizeThatFits)
    }
}
