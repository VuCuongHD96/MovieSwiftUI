//
//  CategoryHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 27/05/2023.
//

import SwiftUI

struct CategoryHeaderView: View {
    
    let rows = [
        GridItem(.flexible())
    ]
    
    struct Constant {
        static let cellHeight: CGFloat = 40
    }
    
    let genreArray: [Genre]
    @Binding var genreIndexSelectedAction: Int?
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(Array(genreArray.enumerated()), id: \.element.id) { index, genre in
                    GenreHeaderSearchView(genre: genre)
                        .frame(height: Constant.cellHeight)
                        .cornerRadius(10)
                        .onTapGesture {
                            genreIndexSelectedAction = index
                        }
                }
            }
            .frame(height: Constant.cellHeight)
        }
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let genreArray: [Genre] = [.action, .adventure, .animation, .comedy, .crime]
        return CategoryHeaderView(genreArray: genreArray,
                                  genreIndexSelectedAction: .constant(3))
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
