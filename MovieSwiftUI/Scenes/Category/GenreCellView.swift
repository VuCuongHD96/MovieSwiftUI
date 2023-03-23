//
//  GenreCellView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/03/2023.
//

import SwiftUI

struct GenreCellView: View {
    
    let categoryName: String
    
    init(categoryName: String) {
        self.categoryName = categoryName
        print("---- debug ------ categoryName = ", categoryName)
    }
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(categoryName)
                .resizable()
                .frame(height: 200)
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
        Group {
            GenreCellView(categoryName: "Action")
            GenreCellView(categoryName: "Animation")
        }
        .previewLayout(.sizeThatFits)
    }
}
