//
//  CategoryHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 27/05/2023.
//

import SwiftUI

struct CategoryHeaderView: View {
    
    @EnvironmentObject private var searchViewModelOutput: SearchViewModel.Output
    
    let rows = [
        GridItem(.flexible())
    ]
    
    struct Constant {
        static let cellHeight: CGFloat = 40
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(searchViewModelOutput.genreArray, id: \.self) { genre in
                    Text(genre.name)
                        .fontWeight(.medium)
                        .font(.title3)
                        .padding()
                        .background(.gray.opacity(0.5))
                        .frame(height: Constant.cellHeight)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                }
            }
            .frame(height: Constant.cellHeight)
        }
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModelOutput = SearchViewModel.Output()
        return CategoryHeaderView()
            .environmentObject(searchViewModelOutput)
    }
}
