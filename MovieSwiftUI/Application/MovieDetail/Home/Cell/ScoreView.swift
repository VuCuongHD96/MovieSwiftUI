//
//  ScoreView.swift
//  MovieSwiftUI
//
//  Created by Work on 07/05/2023.
//

import SwiftUI

struct ScoreView: View {
    
    private struct Constant {
        static let edge: CGFloat = 40
        static let cornerRadius = edge / 2
    }
    
    let movie: MovieItem
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .background(MovieLinearGradient())
                .frame(width: Constant.edge, height: Constant.edge)
                .cornerRadius(Constant.cornerRadius)
            HStack(alignment: .top, spacing: 0) {
                Text(movie.score.naturalPart)
                    .font(.title2)
                Text(".\(movie.score.decimalPart)")
            }
            .foregroundColor(.white)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView(movie: .defaultValue)
            .previewLayout(.sizeThatFits)
    }
}
