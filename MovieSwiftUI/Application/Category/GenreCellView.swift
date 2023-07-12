//
//  GenreCellView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct GenreCellView: View {
    
    let genre: Genre
    
    init(genre: Genre) {
        self.genre = genre
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(genre.name)
                .resizable()
                .frame(height: 200)
            Text(genre.name)
                .foregroundColor(Color.white)
                .fontWeight(.bold)
                .padding(8)
                .background(.ultraThinMaterial)
                .cornerRadius(8)
                .padding(8)
        }
        .cornerRadius(8)
    }
}

struct CategoryCellView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenreCellView(genre: .action)
            GenreCellView(genre: .animation)
        }
        .previewLayout(.sizeThatFits)
    }
}
