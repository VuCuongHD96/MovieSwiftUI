//
//  CastView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/06/2023.
//

import SwiftUI

struct CastView: View {
    
    let url = URL(string: "https://image.tmdb.org/t/p/original/8Vt6mWEReuy4Of61Lnj5Xj704m8.jpg")!

    var body: some View {
        VStack(spacing: 10) {
            AsyncImage(url: url) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(8)
            } placeholder: {
                ProgressView()
            }
            .frame(height: 102)
            Text("Hello, WorldWorld!")
                .font(.footnote)
                .lineLimit(2)
                .frame(width: 70)
        }
        .fixedSize(horizontal: true, vertical: false)
    }
}

struct CastCell_Previews: PreviewProvider {
    static var previews: some View {
        CastView()
    }
}
