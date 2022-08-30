//
//  HomeTopRateGridView.swift
//  MovieSwiftUI
//
//  Created by Work on 04/05/2023.
//

import SwiftUI

struct HomeTopRateGridView: View {
    private let gridRows = [
        GridItem(.fixed(238), spacing: 20),
        GridItem(.fixed(238), spacing: 0),
    ]
    var body: some View {
        VStack {
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHGrid(rows: gridRows, spacing: 10) {
                    ForEach(Array(1...9), id: \.self) { _ in
                        HomeTopRateView()
                    }
                }
            }
        }
    }
}

struct HomeTopRateGridView_Previews: PreviewProvider {
    static var previews: some View {
        HomeTopRateGridView()
            .previewLayout(.sizeThatFits)
    }
}
