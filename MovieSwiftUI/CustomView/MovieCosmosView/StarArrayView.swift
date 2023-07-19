//
//  StarArrayView.swift
//  MovieSwiftUI
//
//  Created by Work on 20/07/2023.
//

import SwiftUI

struct StarArrayView: View {
    
    let squareEdge: CGFloat
    let numberOfStar: Int
    let starSpacing: CGFloat
    
    var body: some View {
        HStack(spacing: starSpacing) {
            ForEach(0..<numberOfStar, id: \.self) { _ in
                Image(systemName: "star.fill")
                    .font(.title)
                    .foregroundColor(.yellow)
                    .frame(width: squareEdge, height: squareEdge)
            }
        }
    }
}

struct StarArrayView_Previews: PreviewProvider {
    static var previews: some View {
        StarArrayView(squareEdge: 30, numberOfStar: 6, starSpacing: 10)
    }
}
