//
//  HomeNowArrayView.swift
//  MovieSwiftUI
//
//  Created by Work on 25/02/2023.
//

import SwiftUI

struct HomeNowArrayView: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(1...5, id: \.self) { _ in
                    HomeNowView()
                }
            }
        }
    }
}

struct HomeNowArrayView_Previews: PreviewProvider {
    static var previews: some View {
        HomeNowArrayView()
            .previewLayout(.sizeThatFits)
    }
}
