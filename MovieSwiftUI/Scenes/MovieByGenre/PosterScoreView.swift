//
//  PosterScoreView.swift
//  MovieSwiftUI
//
//  Created by Work on 02/07/2023.
//

import SwiftUI

struct PosterScoreView: View {
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            Image("PosterImage")
                .resizable()
                .scaledToFit()
            ZStack {
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 40, height: 40)
                Text("7.2")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
            }
            .padding(.bottom, 5)
            .offset(x: 20)
        }
    }
}

struct PosterScoreView_Previews: PreviewProvider {
    static var previews: some View {
        PosterScoreView()
            .previewLayout(.sizeThatFits)
    }
}
