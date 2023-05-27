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
    
    private var icons = ["pencil", "trash", "printer.fill", "folder", "tray", "hare", "headphones", "ant", "mic", "plus.bubble", "video", "leaf"]
    
    struct Constant {
        static let cellHeight: CGFloat = 40
    }
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHGrid(rows: rows) {
                ForEach(icons, id: \.self) {
                    Text($0)
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
        CategoryHeaderView()
    }
}
