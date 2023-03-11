//
//  CategoryView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct CategoryView: View {
    
    var body: some View {
        VStack {
            MovieNavigationView {
                Text("CATEGORY")
                    .font(.custom("Helvetica Neue", size: 20))
                    .foregroundColor(Color.white)
                    .padding(8)
                Spacer()
                Image("SearchWhite")
                    .padding(.trailing, 8)
            }
            ScrollView {
                ForEach(Genre.array, id: \.id) { item in
                    CategoryCellView(categoryName: item.name)
                }
            }
            .padding(EdgeInsets(top: 0, leading: 8, bottom: 0, trailing: 8))
        }
        .ignoresSafeArea()
    }
}

struct CategoryView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryView()
    }
}
