//
//  FavoriteView.swift
//  MovieSwiftUI
//
//  Created by Work on 18/07/2023.
//

import SwiftUI

struct FavoriteView: View {
    
    private let gridRows = [
        GridItem(.flexible(), spacing: 20),
        GridItem(.flexible())
    ]
    
    @State private var click = false
    
    var body: some View {
        MovieNavigationView {
            FavoriteHeaderView(click: $click)
        } bodyContent: {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: gridRows, spacing: 15) {
                    ForEach(0..<2, id: \.self) { movie in
                        FavoriteCell(click: $click)
                            .frame(height: 238)
                    }
                }
            }
            .padding()
        }
    }
}

struct FavoriteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteView()
    }
}
