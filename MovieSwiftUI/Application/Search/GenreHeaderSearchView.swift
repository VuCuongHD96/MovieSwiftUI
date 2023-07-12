//
//  GenreHeaderSearchView.swift
//  MovieSwiftUI
//
//  Created by Work on 17/06/2023.
//

import SwiftUI

struct GenreHeaderSearchView: View {
    
    var genre: Genre
    
    var body: some View {
        Text(genre.name)
            .fontWeight(.medium)
            .font(.title3)
            .padding()
            .background(genre.selected ? .black.opacity(0.5) : .gray.opacity(0.5))
            .foregroundColor(.white)
    }
}

struct GenreHeaderSearchView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GenreHeaderSearchView(genre: Genre.action)
            GenreHeaderSearchView(genre: Genre.adventure)
        }
        .previewLayout(.sizeThatFits)
        .background(
            RoundedRectangle(cornerRadius: 0)
                .fill(LinearGradient(
                    gradient: Gradient(colors: [Color(hex: "F99F00"), Color(hex: "DB3069")]),
                    startPoint: .leading,
                    endPoint: .trailing))
                .ignoresSafeArea(edges: .top)
        )
    }
}
