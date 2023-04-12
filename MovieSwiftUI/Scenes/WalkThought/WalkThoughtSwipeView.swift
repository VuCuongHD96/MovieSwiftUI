//
//  WalkThoughtSwipeView.swift
//  MovieSwiftUI
//
//  Created by Work on 11/04/2023.
//

import SwiftUI

struct WalkThoughtSwipeView: View {
    
    @State private var circleOffsetX: CGFloat = 0
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 50)
                .offset(x: circleOffsetX)
                .gesture (
                    DragGesture()
                        .onChanged { value in
                            print("----- value = ", value.translation.width)
                            circleOffsetX = value.translation.width
                        }
                        .onEnded { _ in
                            circleOffsetX = 0
                        }
                )
            Spacer()
        }
        .frame(width: 400)
        .background(Color.yellow)
    }
}

struct WalkThoughtSwipeView_Previews: PreviewProvider {
    static var previews: some View {
        WalkThoughtSwipeView()
    }
}
