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
    
    var body: some View {
        ZStack {
            Circle()
                .fill(Color.clear)
                .background(MovieLinearGradient())
                .frame(width: Constant.edge, height: Constant.edge)
                .cornerRadius(Constant.cornerRadius)
                .padding(8)
            HStack(alignment: .top, spacing: 0) {
                Text("9")
                    .font(.title2)
                Text(".9")
            }
            .foregroundColor(.white)
        }
    }
}

struct ScoreView_Previews: PreviewProvider {
    static var previews: some View {
        ScoreView()
            .previewLayout(.sizeThatFits)
    }
}
