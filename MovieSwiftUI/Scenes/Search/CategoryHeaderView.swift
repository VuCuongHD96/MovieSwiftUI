//
//  CategoryHeaderView.swift
//  MovieSwiftUI
//
//  Created by Work on 27/05/2023.
//

import SwiftUI

struct CategoryHeaderView: View {
    
    @EnvironmentObject private var searchViewModelInput: SearchViewModel.Input
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
                ForEach(searchViewModelOutput.genreArray, id: \.id) { genre in
                    Text(genre.name)
                        .fontWeight(.medium)
                        .font(.title3)
                        .padding()
                        .background(genre.selected ? .black.opacity(0.5) : .gray.opacity(0.5))
                        .frame(height: Constant.cellHeight)
                        .cornerRadius(10)
                        .foregroundColor(.white)
                        .onTapGesture {
                            searchViewModelInput.genreSelectedTrigger.send(genre)
                        }
                }
            }
            .frame(height: Constant.cellHeight)
        }
    }
}

struct CategoryHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        let searchViewModelInput = SearchViewModel.Input()
        let searchViewModelOutput = SearchViewModel.Output()
        searchViewModelOutput.genreArray = Genre.array
        return CategoryHeaderView()
            .environmentObject(searchViewModelInput)
            .environmentObject(searchViewModelOutput)
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
