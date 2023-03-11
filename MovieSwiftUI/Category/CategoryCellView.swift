//
//  CategoryCellView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct CategoryCellView: View {
    let categoryName: String
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(categoryName)
                .resizable()
                .frame(height: 220)
            Text(categoryName)
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
        CategoryCellView(categoryName: "Action")
            .previewLayout(.sizeThatFits)
    }
}
